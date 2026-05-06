# BRIJ x402 Directory

Static JSON directory of x402 services.

This repo is only for discovery. It does not proxy requests, hold keys, or run a backend.

BRIJ Wallet handles payment through its MCP/payment runtime. This directory helps humans and AI assistants find x402 endpoints and OpenAPI specs.

## Files

```text
index.json
providers/
openapi/
```

## How To Use

Start with:

```text
https://raw.githubusercontent.com/brij-digital/x402-directory/main/index.json
```

Then open a provider file and its OpenAPI JSON.

An AI assistant can read this repo, choose the right endpoint, then call it through BRIJ Wallet.

## Rules

- JSON only.
- No secrets.
- No backend assumptions.
- Keep provider metadata short.
- Keep OpenAPI files cached and reviewable.
