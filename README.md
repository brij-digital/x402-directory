# BRIJ x402 Directory

Static JSON directory of x402 services.

This repo is only for discovery. It does not proxy requests, hold keys, or run a backend.

This directory helps humans and AI assistants find paid x402 endpoints and OpenAPI specs.

## Files

```text
index.html
index.json
llms.txt
providers/
```

## How To Use

Start with:

```text
https://x402catalog.com/index.json
```

`index.json` includes purpose, agent instructions, provider summaries, use cases, x402 base URLs, and absolute links. An AI assistant should be able to start there without guessing what this repo is for.

Then open only the selected provider file. Each provider file contains metadata, optional agent guidance, and the full OpenAPI object. All URLs in `index.json` are absolute so an AI assistant does not need to guess paths.

`llms.txt` is a short Markdown guide for browsing AI agents. It points agents back to `index.json`; it is not the source of truth.

Execution is client-specific:
- With BRIJ Wallet MCP, follow the MCP tool instructions and call `call_paid_api_endpoint`.

Raw GitHub fallback:

```text
https://raw.githubusercontent.com/brij-digital/x402-directory/main/index.json
```

## Rules

- JSON only.
- No secrets.
- No backend assumptions.
- Keep provider metadata short.
- Keep OpenAPI embedded in the selected provider file.
