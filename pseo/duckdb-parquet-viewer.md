---
layout: default
title: "DuckDB Parquet Viewer — Browse and Query Parquet Files"
description: "View and query Apache Parquet files using DuckDB in your browser. Schema inspection, predicate pushdown, zero installation."
permalink: /duckdb/parquet-viewer/
---

# DuckDB Parquet Viewer

Parquet files are binary — you can't just open them in a text editor. PondPilot uses DuckDB WASM to let you browse, inspect, and query Parquet files directly in your browser.

## Instant Schema Inspection

Drop a Parquet file into PondPilot and immediately see:

- Column names and data types
- Row count
- Parquet metadata (row groups, compression)

```sql
SELECT * FROM parquet_metadata('dataset.parquet');
```

No `pyarrow`, no `parquet-tools`, no command line. Just drag and drop.

## Query with Predicate Pushdown

DuckDB reads Parquet files intelligently. When you filter or select specific columns, DuckDB skips irrelevant row groups and columns:

```sql
SELECT user_id, event_type, timestamp
FROM events.parquet
WHERE event_type = 'purchase' AND timestamp > '2024-01-01';
```

This query only reads the columns and row groups it needs — fast even on large files.

## Browse Data Visually

PondPilot renders query results in a sortable grid. Quickly scan through Parquet data, spot patterns, and drill down with more specific queries.

## Common Parquet Workflows

**Data lake exploration:** Got a Parquet export from your data lake? Explore it locally before writing pipeline code.

**Validating exports:** Check that a Parquet file has the expected schema, row count, and data distribution.

**Format conversion:** Query Parquet data and export results as CSV for colleagues who need a spreadsheet.

**Comparing versions:** Open two Parquet files and use `EXCEPT` or `JOIN` to find differences.

## No Installation, No Uploads

PondPilot runs DuckDB WASM in your browser. Your Parquet files stay on your machine. Open [app.pondpilot.io](https://app.pondpilot.io) and start viewing Parquet files immediately.

## Open Source

PondPilot is free and open source. No limits on file size (beyond your browser's memory), no feature gates, no accounts.

[Open PondPilot](https://app.pondpilot.io) and drop your first Parquet file.
