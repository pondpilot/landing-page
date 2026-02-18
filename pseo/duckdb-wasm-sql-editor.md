---
layout: default
title: "DuckDB WASM SQL Editor — Full SQL in the Browser"
description: "A polished SQL editor powered by DuckDB WASM. Syntax highlighting, autocomplete, multi-file support. Runs entirely client-side."
permalink: /duckdb/wasm-sql-editor/
---

# DuckDB WASM SQL Editor

DuckDB WASM is powerful, but using it raw means writing JavaScript glue code. PondPilot wraps it in a proper SQL editor with everything you'd expect from a desktop tool — running entirely in your browser.

## A Real Editor, Not a Textarea

PondPilot gives you a proper SQL editing experience:

- **Syntax highlighting** for DuckDB's SQL dialect
- **Autocomplete** for table names, column names, and SQL keywords
- **Multi-tab queries** to organize different analyses
- **Result grid** with sortable columns
- **Query history** within your session

All powered by DuckDB WASM under the hood.

## Why DuckDB WASM?

DuckDB WASM brings a full analytical database engine to the browser. Unlike SQLite WASM (which is row-oriented and less suited for analytics), DuckDB is columnar and optimized for the kind of queries data people write: aggregations, window functions, joins on large tables.

The WASM build is maintained by the DuckDB team and supports most features of the native build — including Parquet reading, JSON processing, and advanced SQL syntax.

## Use Cases

**Quick data exploration:** Drop a file and start querying. Faster than spinning up a notebook.

**Prototyping queries:** Write and test DuckDB SQL before deploying it in your data pipeline.

**Presentations:** Show live SQL demos in a browser without worrying about local environment setup.

**Teaching:** Use PondPilot or [PondPilot Widget](https://widget.pondpilot.io) to demonstrate DuckDB SQL to students.

## Client-Side Only

No server processes your queries. No telemetry captures your SQL. Your data and your queries stay in your browser tab. When you close the tab, it's gone.

## Open Source

PondPilot is fully open source on [GitHub](https://github.com/pondpilot). Contribute, fork, self-host, or just inspect the code.

## Start Querying

[Open PondPilot](https://app.pondpilot.io) and experience DuckDB WASM with a proper editor.
