---
layout: default
title: "SQL Editor for Documentation — Embed Interactive Queries"
description: "Embed a live SQL editor in your docs, blog, or tutorial. Readers run queries in-browser. No backend required."
permalink: /use-cases/sql-editor-for-documentation/
---

# SQL Editor for Documentation

Static SQL code blocks in docs are fine until your reader wants to tweak a query. PondPilot Widget lets you embed a live, interactive SQL editor that readers can actually run.

## How PondPilot Widget Works

[PondPilot Widget](https://widget.pondpilot.io) is an embeddable SQL editor powered by DuckDB WASM. Add it to any webpage and your readers get:

- A syntax-highlighted SQL editor
- A "Run" button that executes queries in their browser
- Results displayed inline
- The ability to modify the query and re-run

No backend on your end. No API keys. No usage limits.

## Perfect for Technical Documentation

If you're documenting a data format, an API response structure, or a SQL-based tool, let readers explore the data themselves:

- **API docs:** Embed sample queries against example response data
- **Data catalogs:** Let users preview table schemas and sample rows
- **SQL tutorials:** Teach concepts with editable, runnable examples
- **Blog posts:** Make data analysis posts interactive

## Zero Infrastructure

Most interactive code playgrounds require you to host a server or pay for a service. PondPilot Widget runs entirely client-side. Embed it in a static site, a GitHub Pages blog, or a Notion-exported page. It just works.

## Readers Keep Their Privacy

Since queries run in the reader's browser via WebAssembly, you're not collecting their query history or the data they explore. Good for you (no liability), good for them (no tracking).

## Quick Setup

Embedding PondPilot Widget takes a single HTML snippet. Check the [Widget docs](https://widget.pondpilot.io) for integration instructions. Works with Jekyll, Hugo, Docusaurus, MkDocs, or plain HTML.

## See It in Action

Visit [widget.pondpilot.io](https://widget.pondpilot.io) to try the widget yourself and grab the embed code.
