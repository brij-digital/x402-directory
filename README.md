# BRIJ x402 Directory

Static JSON directory of x402 services.

This repo is only for discovery. It does not proxy requests, hold keys, or run a backend.

This directory helps humans and AI assistants find paid x402 endpoints and OpenAPI specs.

## Files

```text
index.html
index.json
providers/
openapi/
```

## How To Use

Start with:

```text
https://brij-digital.github.io/x402-directory/index.json
```

`index.json` includes purpose, agent instructions, provider summaries, use cases, x402 base URLs, and absolute links. An AI assistant should be able to start there without guessing what this repo is for.

Then open a provider file and its OpenAPI JSON. All URLs in `index.json` are absolute so an AI assistant does not need to guess paths.

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
- Keep OpenAPI files cached and reviewable.
