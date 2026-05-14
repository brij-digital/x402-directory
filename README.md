# BRIJ x402 Directory

Static JSON directory of x402 services.

This repo is only for discovery. It does not proxy requests, hold keys, or run a backend.

This directory helps humans and AI assistants find paid x402 endpoints and OpenAPI specs.

## Files

```text
index.html
llms.txt
providers/
scripts/sync-openapi.sh
```

## Source Of Truth

Provider API schemas live next to the provider code. For example:

```text
x402-travel/internal/handler/openapi.json
```

This repo packages those schemas for public discovery by embedding them in
`providers/*.json` together with short metadata and agent guidance.

Do not hand-edit embedded `openapi` objects here unless you are intentionally
patching the public package before syncing the provider repo.

For Travel, sync from the local provider repo:

```bash
scripts/sync-openapi.sh travel
```

Or sync from the live provider endpoint:

```bash
scripts/sync-openapi.sh travel https://travel.brij.fi/openapi.json
```

## How To Use

For AI agents, start with:

```text
https://x402catalog.com/llms.txt
```

`llms.txt` is the short table of contents. Then open only the selected provider file. Each provider file contains metadata, optional agent guidance, and the full OpenAPI object.

Execution is client-specific:
- With BRIJ Wallet MCP, follow the MCP tool instructions and call `call_paid_api_endpoint`.

Raw GitHub fallback:

```text
https://raw.githubusercontent.com/brij-digital/x402-directory/main/llms.txt
```

## Rules

- JSON only.
- No secrets.
- No backend assumptions.
- Keep provider metadata short.
- Keep OpenAPI embedded in the selected provider file.
