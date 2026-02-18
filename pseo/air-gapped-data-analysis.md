---
layout: page
title: "Air-Gapped Data Analysis — SQL Without Network Access"
description: "Run SQL analytics on air-gapped machines. PondPilot works offline as a PWA — no internet, no servers, no data exfiltration risk."
permalink: /privacy/air-gapped-data-analysis/
---


Some environments have no internet access by design. Classified networks, secure facilities, isolated lab machines. PondPilot works on all of them — install it once while online, then use it forever offline.

## How to Deploy on Air-Gapped Systems

1. On a connected machine, visit [app.pondpilot.io](https://app.pondpilot.io) and install as a PWA
2. Transfer the machine (or a pre-configured browser profile) to the air-gapped network
3. Open PondPilot and start analyzing data

Alternatively, since PondPilot is open source, you can build and host it on an internal network. Clone the repo, build the static assets, serve them from any HTTP server on your intranet.

## Why Air-Gapped Environments Need Better Tools

Analysts on classified or restricted networks often resort to Excel or manual inspection because modern analytics tools require cloud connectivity. PondPilot fills that gap with real SQL capabilities that work completely offline.

## Full SQL on Local Files

DuckDB runs as WebAssembly in the browser. On an air-gapped machine, you get:

- `SELECT`, `JOIN`, `GROUP BY`, `WINDOW` functions — the full SQL toolkit
- CSV, Parquet, JSON, and DuckDB file support
- Multi-file sessions
- Query history within the session
- Export results to CSV

## Zero Exfiltration Risk

PondPilot makes no network requests during operation. There's no telemetry, no "call home" behavior, no update checks. On an air-gapped network, this is verifiable — there's simply nowhere for data to go.

## For Government, Defense, and Regulated Industries

If your security policies require air-gapped data processing, PondPilot is one of the few modern analytics tools that complies by default. No waivers, no exceptions, no workarounds.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) to install PondPilot, or [build from source](https://github.com/pondpilot) for internal deployment.

---

## Related

- [Offline Data Analysis Tool](/privacy/offline-data-analysis-tool/)
- [No-Cloud SQL Editor](/privacy/no-cloud-sql-editor/)
- [Local Data Analysis Tool](/privacy/local-data-analysis-tool/)
