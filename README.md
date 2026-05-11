# BRIJ x402 Directory

Static JSON directory of x402 services.

This repo is only for discovery. It does not proxy requests, hold keys, or run a backend.

This directory helps humans and AI assistants find paid x402 endpoints and OpenAPI specs.

## Files

```text
index.html
llms.txt
providers/
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
