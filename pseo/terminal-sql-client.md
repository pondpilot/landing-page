---
layout: page
title: "Terminal SQL Client — Query DuckDB From Your Shell"
description: "Quack is a terminal SQL client for DuckDB with vim-style editing, schema explorer, and a results browser. No GUI, no browser, no accounts."
permalink: /tools/terminal-sql-client/
---


If your workflow lives in tmux and a keyboard, a browser-based SQL tool is friction. Quack is a terminal SQL client — a lazygit-style TUI for DuckDB that keeps you in the shell where everything else already runs.

## What Quack Is

Quack is a keyboard-driven TUI for writing SQL against DuckDB and other databases. You open it like any CLI tool, point it at a database file, and start querying. No Electron window, no local server spawning in the background, no login screen.

```bash
cargo install quack-sql
# or
brew install pondpilot/tap/quack
```

Then launch it and hit `SPC` for the leader menu. `Ctrl+E` runs your query. `:q` quits. The muscle memory is familiar on purpose.

## Why a Terminal Client?

**Fits your existing shell workflow.** Launch Quack in a tmux pane next to your editor, logs, and SSH sessions. Move between them the same way you already do.

**SSH-friendly.** Running analytics on a remote box? Quack works over SSH the same way it works locally. No X forwarding, no port tunnels for a web UI.

**Keyboard-first.** Modal vim-style editing with operator+motion composition, a command palette (`Ctrl+P`), which-key hints, and a schema explorer (`Ctrl+S`) you navigate by arrow keys. Your mouse stays untouched.

**No context switch.** You're already in a terminal. Stay there.

## What You Actually Get

- **Vim-style editing** with syntax highlighting and autocompletion
- **Schema explorer** — tree view of catalogs, schemas, tables, views, indexes, functions
- **Results browser** — paginated, sortable, filterable, with aggregates, sparklines, and export
- **Multi-database** — DuckDB plus SQLite, PostgreSQL, and MySQL connections
- **Session persistence** — tabs, editor buffers, and query history restored on relaunch
- **Command palette** — leader key with which-key hints for 40+ actions, plus snippets

The TUI has three panes you'd expect: schema on the left, editor top-right, results below. `Tab` cycles through them.

## Fits a Scripted Pipeline

Because Quack is a normal CLI binary, it coexists cleanly with the rest of your shell toolkit. Keep ad-hoc exploration interactive in Quack, then drop the final SQL into a `.sql` file your pipeline already runs through `duckdb`, `make`, or a scheduler. Same query, two surfaces.

## Install Quack

Grab a release or build from source at the [Quack GitHub repository](https://github.com/pondpilot/quack). MIT licensed, no telemetry, no account.

---

## Related

- [CLI DuckDB Client](/tools/cli-duckdb-client/)
- [Open Source SQL Editor](/use-cases/open-source-sql-editor/)
- [No-Cloud SQL Editor](/privacy/no-cloud-sql-editor/)
