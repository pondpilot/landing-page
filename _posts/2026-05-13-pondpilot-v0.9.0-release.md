---
layout: post
title: "PondPilot v0.9.0: MotherDuck, DuckLake, Quack, and SQL Linting"
date: 2026-05-13
author: "Polly"
image: "/blog/images/v0.9.0.webp"
---

PondPilot v0.9.0 adds three new data source integrations — MotherDuck, DuckLake, and Quack — and built-in SQL linting in the editor.

## ☁️ MotherDuck Integration

You can now connect to MotherDuck cloud databases directly from PondPilot and query them alongside your local data.

### How it works

- Open the datasource wizard and pick the MotherDuck card
- Paste your service token and run a test connection
- Connect — your MotherDuck databases appear in the sidebar with schemas, tables, and columns

The extension loads dynamically from `ext.motherduck.com`, so no special build is needed. Tokens are stored in the encrypted secret store and auto-reconnect on reload. Production now serves the `Cross-Origin-Opener-Policy` and `Cross-Origin-Embedder-Policy` headers so `SharedArrayBuffer` is available for the extension.

## 🌊 DuckLake Catalogs

The datasource wizard has a new "DuckLake Catalog" source type.

### What you can do

- Paste a `.ducklake` URL into the "DuckLake Catalog" card
- The alias auto-derives from the path; a read-only toggle and CORS proxy option sit next to it
- Tables appear in the sidebar under "Remote Data Sources" and are searchable via spotlight
- The catalog reconnects automatically on reload

DuckLake catalogs are public URLs, so no credentials are involved. This release also upgrades DuckDB-WASM to DuckDB v1.5.1, which closes the storage-version compatibility issue when opening files created with newer DuckDB releases.

## 🦆 Quack Protocol

Quack Server is now a first-class data source in PondPilot.

### What you get

- Connect to a Quack server through the datasource wizard with a token
- The token is stored encrypted; databases attach and reconnect automatically on app reload
- Quack databases work everywhere local sources do — queries, the data explorer, and comparison tabs

## 🔍 SQL Linting

The SQL editor now ships with built-in linting via FlowScope.

### What this means in practice

- A new **SQL Linting** panel in Settings lets you toggle rules on or off and filter diagnostics by severity
- Disable a specific rule directly from the editor's context menu
- Apply **Fix** or **Fix All** through Monaco's code actions for any auto-fixable issue

## 🐛 Bug fixes

- Fixed table alignment and theme consistency issues in the data view

## Try it out

The new features are available now at [app.pondpilot.io](https://app.pondpilot.io). For the full changelog, see the [v0.9.0 release on GitHub](https://github.com/pondpilot/pondpilot/releases/tag/v0.9.0).

If you run into issues or have feedback, let us know through [GitHub Issues](https://github.com/pondpilot/pondpilot/issues) or the built-in feedback reporter.

Happy data exploring! 🦆

---

_PondPilot is your browser-based data exploration companion, powered by DuckDB and designed for privacy-first analytics. All processing happens locally in your browser — your data never leaves your device._
