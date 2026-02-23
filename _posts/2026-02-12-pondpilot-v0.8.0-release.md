---
layout: post
title: "PondPilot v0.8.0: Charts, AI Assistant, and Monaco Editor"
date: 2026-02-23
author: "Polly"
image: "/blog/images/v0.8.0.png"
---

PondPilot v0.8.0 is the largest release to date, with 15 new features and 6 bug fixes. The main additions are interactive chart visualization, a built-in AI assistant, migration to the Monaco code editor, script version history, and expanded data format support.

## 📊 Chart Visualization

Data tabs now include a chart view alongside the table view. You can switch between them to visualize query results without leaving PondPilot.

### What you can do

- Choose from multiple chart types (bar, line, scatter, and more)
- Configure axes, grouping, and aggregation
- Use "small multiples" to compare subsets of your data side by side
- Export any chart as a PNG image
- View charts in fullscreen mode

This is useful when you need a quick visual overview of your data before diving into deeper analysis.

## 🤖 Polly AI Assistant

PondPilot now ships with a built-in AI assistant called Polly. It's available directly in the app — no API key or configuration required.

### How it works

- Open the AI panel from the sidebar
- Ask questions about your data, SQL syntax, or analysis approach
- Polly uses a demo token for authentication, so it works out of the box

If you prefer to use your own API key, that's supported too — credentials are stored securely using the new encrypted secret store (see below).

## ⚡ Monaco Editor

The SQL editor has been migrated from CodeMirror to Monaco — the same editor engine used in VS Code.

### What this means in practice

- **Context-aware autocomplete** powered by FlowScope SQL analysis — completions are based on your actual database schema, not just keywords
- **Code folding** for long queries
- **Go-to-definition** and **find references** for tables and columns
- **Rename symbol** across your query
- **Hover tooltips** with type information
- Improved performance for large documents

## 📜 Script Version History

PondPilot now automatically tracks versions of your SQL scripts. A new version is saved on every query run, manual save, and tab close.

### What you get

- Browse the full version history of any script
- Preview changes between versions with a diff view
- Restore any previous version with one click
- Versions are stored locally in IndexedDB — nothing leaves your browser

This is especially helpful when iterating on complex queries, where you might want to go back to a previous approach.

## 📁 Expanded Data Format Support

### Statistical file formats

PondPilot now reads statistical data files natively:

- **SAS**: .sas7bdat, .xpt
- **SPSS**: .sav, .zsav, .por
- **Stata**: .dta

These files are loaded directly through a DuckDB extension — no external conversion needed.

### Convert To and Parquet export

Right-click any file or table to convert it to a different format. The new "Convert To" context menu includes Parquet export with configurable compression (Snappy, gzip, zstd).

## Other notable additions

- **Custom S3 endpoints** — connect to S3-compatible services like MinIO, DigitalOcean Spaces, and Backblaze B2
- **Encrypted secret store** — securely store credentials for Iceberg catalogs and AI API keys using Web Crypto API encryption
- **Tab takeover** — when multiple PondPilot tabs are open, blocked tabs show a "Take Over" button instead of silently failing
- **Spotlight LRU** — the spotlight search now prioritizes your recently used items
- **What's New modal** — split-view release history so you can browse past changes

## 🐛 Bug fixes

- Fixed Ctrl+C copying table cell content instead of selected editor text
- Fixed DataCloneError and React setState-during-render warnings
- Switched SQL splitting to FlowScope AST for more accurate statement parsing
- Fixed incorrect database name when creating comparison from file source
- Fixed dbname parsing in proxied ATTACH statements

## Try it out

The new features are available now at [app.pondpilot.io](https://app.pondpilot.io). For the full changelog, see the [v0.8.0 release on GitHub](https://github.com/pondpilot/pondpilot/releases/tag/v0.8.0).

If you run into issues or have feedback, let us know through [GitHub Issues](https://github.com/pondpilot/pondpilot/issues) or the built-in feedback reporter.

Happy data exploring! 🦆

---

_PondPilot is your browser-based data exploration companion, powered by DuckDB and designed for privacy-first analytics. All processing happens locally in your browser — your data never leaves your device._
