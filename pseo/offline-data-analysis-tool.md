---
layout: default
title: "Offline Data Analysis Tool — SQL Without Internet"
description: "Analyze CSV, Parquet, and JSON files with SQL offline. PondPilot works as a PWA — install once, use anywhere, no internet needed."
permalink: /privacy/offline-data-analysis-tool/
---

# Offline Data Analysis Tool

PondPilot works without an internet connection. Install it as a Progressive Web App, go offline, and analyze your data with full SQL support.

## Install Once, Use Anywhere

Visit [app.pondpilot.io](https://app.pondpilot.io) once, install it as a PWA (your browser will prompt you or use the install option in the address bar), and you're set. The app caches everything locally — DuckDB WASM engine included.

Next time you open it, even without internet, you get the full SQL editor with all features intact.

## Why Offline Matters

**Air-gapped environments:** Some networks prohibit internet access entirely. Government, defense, and critical infrastructure teams need tools that work without phoning home.

**Travel:** Analyze data on a flight, on a train, or in a hotel with bad WiFi. No "reconnecting..." spinners.

**Unreliable networks:** Field work, remote locations, conference WiFi — PondPilot doesn't care about your connection quality.

**Security policy:** Some organizations require that sensitive data analysis happens on machines disconnected from the internet. PondPilot supports that workflow natively.

## Full Features Offline

This isn't a degraded "offline mode" with half the features missing. You get:

- Full DuckDB SQL (joins, window functions, CTEs, aggregations)
- CSV, Parquet, JSON, and DuckDB file support
- Multi-file sessions
- Syntax highlighting and autocomplete
- Export results to CSV

Everything runs in WebAssembly. No server calls, no API dependencies.

## No Phone-Home Telemetry

Some "offline" apps still try to sync data when they detect a connection. PondPilot doesn't. There's no telemetry, no usage tracking, no sync feature. Offline means offline.

## Get PondPilot Offline

1. Visit [app.pondpilot.io](https://app.pondpilot.io) while online
2. Install as PWA
3. Go offline and use it whenever you need

Free, open source, no account required.
