---
layout: page
title: "CLI DuckDB Client — A TUI Built Around DuckDB"
description: "Quack is a CLI client built around DuckDB. Open .duckdb files, browse schemas, run SQL, and explore results from a keyboard-driven terminal UI."
permalink: /tools/cli-duckdb-client/
---


DuckDB ships with a solid REPL, but a REPL isn't a client. Once you're running CTEs longer than your scrollback, paging through result sets, or flipping between schemas, you want a proper UI — without leaving the terminal. Quack is that UI: a CLI client built around DuckDB first.

## DuckDB-Native by Design

Quack is written in Rust and treats DuckDB as its primary engine. Point it at a `.duckdb` file and you get everything the DuckDB ecosystem offers — CSV, Parquet, and JSON reads, views, indexes, user-defined functions — surfaced in a TUI instead of a bare prompt.

```bash
cargo install quack-sql
quack path/to/analytics.duckdb
```

You can also connect to SQLite, PostgreSQL, and MySQL from the same session, but the experience is tuned for DuckDB workflows.

## What the REPL Doesn't Give You

**A schema explorer.** Press `Ctrl+S` for a tree view of catalogs, schemas, tables, views, indexes, and functions. Expand, jump to definition, and paste identifiers into the editor without typing them.

**A real editor.** Modal vim-style editing with syntax highlighting, autocompletion, and multi-line buffers. Write the kind of query you'd actually commit, not the kind you type once.

**A results browser.** Paginated tables with sorting, filtering, column aggregates, and sparklines. Export to CSV, Parquet, or JSON from the result pane.

**Tabs and persistence.** Multiple editor tabs per session. Close Quack, reopen it, and your tabs, buffers, and query history come back.

**A command palette.** `Ctrl+P` opens 40+ actions, plus your own SQL snippets.

## The DuckDB Query You Actually Wrote

Because Quack delegates SQL execution to DuckDB itself, dialect behavior matches what you'd get at the `duckdb` CLI. Read a Parquet file directly:

```sql
SELECT region, SUM(amount) AS total
FROM read_parquet('s3://bucket/orders/*.parquet')
GROUP BY region
ORDER BY total DESC;
```

Attach another DuckDB database, query a view, or call an extension function — whatever DuckDB supports, Quack runs.

## Install

Cargo, Homebrew, or prebuilt binaries from the [Quack GitHub repository](https://github.com/pondpilot/quack). No accounts, no telemetry, no browser dependency.

## If You Want the Full GUI

Quack is the terminal client in the PondPilot family. The [PondPilot App](https://app.pondpilot.io) is the same DuckDB engine in a browser, if you want to hand a colleague a URL instead of a binary.

---

## Related

- [Terminal SQL Client](/tools/terminal-sql-client/)
- [DuckDB Browser Tool](/duckdb/browser-tool/)
- [Open Source SQL Editor](/use-cases/open-source-sql-editor/)
