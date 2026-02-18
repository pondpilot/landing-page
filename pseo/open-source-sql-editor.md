---
layout: default
title: "Open Source SQL Editor — Free, Transparent, Community-Driven"
description: "A fully open source SQL editor that runs in your browser. Inspect the code, contribute, or self-host. Powered by DuckDB WASM."
permalink: /use-cases/open-source-sql-editor/
---

# Open Source SQL Editor

PondPilot is fully open source under a permissive license. Every line of code is on [GitHub](https://github.com/pondpilot). No proprietary backend, no hidden telemetry, no "open core" bait-and-switch.

## Why Open Source Matters for a Data Tool

When a tool processes your data, you should be able to verify what it does with that data. Closed-source tools ask you to trust their privacy policy. Open source tools let you read the code.

PondPilot's architecture is verifiable:
- No server-side code (there is no server)
- No analytics SDKs in the app
- No data exfiltration paths

## Self-Host If You Want

PondPilot is a static web application. Clone the repo, build it, and serve it from your own infrastructure. Perfect for organizations that can't use external web apps.

```bash
git clone https://github.com/pondpilot/app
cd app
npm install && npm run build
# Serve the dist/ directory from any HTTP server
```

## Contribute

Found a bug? Want a feature? PondPilot accepts contributions. The codebase is TypeScript (app), Rust (FlowScope), and standard web technologies. Open an issue or submit a PR.

## The PondPilot Family

Three open source tools, one mission:

- **[PondPilot App](https://app.pondpilot.io):** Browser-based SQL analytics on local files
- **[PondPilot Widget](https://widget.pondpilot.io):** Embeddable interactive SQL for docs and blogs
- **[FlowScope](https://pondpilot.io/flowscope/):** SQL lineage visualization engine (Rust + WASM)

## No "Open Core" Games

Everything is open source. There's no paid tier, no enterprise edition, no feature gates. The same tool is available to everyone.

## Free Forever

Open source means no one can take it away. Even if the project stops being maintained, the code is there for anyone to fork and continue.

## Get Started

[Open PondPilot](https://app.pondpilot.io) or browse the [source code](https://github.com/pondpilot).
