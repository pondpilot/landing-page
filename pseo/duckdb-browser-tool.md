---
layout: default
title: "DuckDB Browser Tool — Run DuckDB in Your Browser"
description: "Use DuckDB directly in your browser. Query CSV, Parquet, JSON files with SQL. No installation, powered by DuckDB WASM."
permalink: /duckdb/browser-tool/
---

# DuckDB Browser Tool

DuckDB is a fast, embeddable analytical database. PondPilot puts it in your browser — no installation, no terminal, no Python. Just open a tab and start querying.

## DuckDB WASM, Ready to Use

PondPilot bundles DuckDB compiled to WebAssembly. You get the same SQL engine that data engineers love, running directly in your browser tab. The full DuckDB feature set — analytical functions, nested types, Parquet support — all available from a web UI.

## Who This Is For

**DuckDB curious:** You've heard about DuckDB and want to try it without installing anything. PondPilot is the fastest way to get a feel for DuckDB's SQL dialect.

**Quick analysis:** You have a CSV and need answers now. Don't want to open a terminal, create a virtual environment, and write a Python script. Just drop the file and query.

**Sharing results:** Analyze data and share findings with teammates who don't have DuckDB installed locally.

## Full DuckDB SQL

PondPilot doesn't limit the SQL you can write. Everything DuckDB WASM supports, you can use:

```sql
-- Pivot table
PIVOT sales.csv ON quarter USING SUM(revenue) GROUP BY product;

-- List aggregation
SELECT department, LIST(employee_name) as team
FROM employees.csv
GROUP BY department;

-- Window functions
SELECT *, revenue - LAG(revenue) OVER (ORDER BY date) as daily_change
FROM daily_metrics.csv;
```

## Multi-Format Support

DuckDB natively reads CSV, Parquet, JSON, and its own `.duckdb` format. PondPilot supports all of them. Open multiple files and join across formats in a single query.

## Complements Your Local DuckDB Workflow

Use DuckDB CLI or Python for heavy lifting, PondPilot for quick visual exploration and ad-hoc queries. They speak the same SQL dialect, so queries are portable between them.

## Try DuckDB in Your Browser

[Open PondPilot](https://app.pondpilot.io) — no signup, free, open source.

---

## Related

- [DuckDB Online Playground](/duckdb/online-playground/)
- [DuckDB WASM SQL Editor](/duckdb/wasm-sql-editor/)
- [DuckDB CSV Query](/duckdb/csv-query/)
