#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/sync-openapi.sh <provider> [openapi-json-path-or-url]

Examples:
  scripts/sync-openapi.sh travel
  scripts/sync-openapi.sh travel ../x402-travel/internal/handler/openapi.json
  scripts/sync-openapi.sh travel https://travel.brij.fi/openapi.json

This updates providers/<provider>.json by replacing only its embedded
.openapi object. Provider metadata and agent guidance stay in this repo.
EOF
}

provider="${1:-}"
source="${2:-}"

if [[ -z "$provider" || "$provider" == "-h" || "$provider" == "--help" ]]; then
  usage
  exit 0
fi

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

provider_file="providers/${provider}.json"
if [[ ! -f "$provider_file" ]]; then
  echo "Provider file not found: $provider_file" >&2
  exit 1
fi

if [[ -z "$source" ]]; then
  case "$provider" in
    travel)
      source="../x402-travel/internal/handler/openapi.json"
      ;;
    *)
      echo "No default OpenAPI source for provider '$provider'." >&2
      echo "Pass a local JSON path or URL explicitly." >&2
      exit 1
      ;;
  esac
fi

command -v jq >/dev/null || {
  echo "jq is required." >&2
  exit 1
}

tmp_openapi="$(mktemp)"
tmp_provider="$(mktemp)"
trap 'rm -f "$tmp_openapi" "$tmp_provider"' EXIT

case "$source" in
  http://*|https://*)
    command -v curl >/dev/null || {
      echo "curl is required for URL sources." >&2
      exit 1
    }
    curl -fsSL "$source" > "$tmp_openapi"
    ;;
  *)
    if [[ ! -f "$source" ]]; then
      echo "OpenAPI source not found: $source" >&2
      exit 1
    fi
    cp "$source" "$tmp_openapi"
    ;;
esac

jq empty "$tmp_openapi"
jq --slurpfile openapi "$tmp_openapi" '.openapi = $openapi[0]' "$provider_file" > "$tmp_provider"
mv "$tmp_provider" "$provider_file"

echo "Updated $provider_file from $source"
