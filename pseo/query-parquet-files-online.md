---
layout: default
title: "Query Parquet Files Online — Browser-Based SQL"
description: "Open and query Apache Parquet files in your browser with SQL. No Python, no Spark, no server. DuckDB WASM powered."
permalink: /use-cases/query-parquet-files-online/
---

# Query Parquet Files Online

Parquet is the go-to columnar format for analytics, but querying it usually means spinning up Python, Spark, or a database. PondPilot lets you query Parquet files directly in your browser with SQL.

## Zero Setup Parquet Querying

No `pip install`, no `import pandas`, no Jupyter kernel restarts. Open [app.pondpilot.io](https://app.pondpilot.io), drop a `.parquet` file, and run SQL immediately.

DuckDB's native Parquet support means you get predicate pushdown and column pruning for free — even in the browser. Queries on large Parquet files are fast because DuckDB only reads the columns and row groups you actually need.

## Inspect Schema Instantly

Not sure what's in that Parquet file someone sent you? PondPilot shows you the schema — column names, types, and row counts — the moment you open it. No guessing, no `parquet-tools` CLI.

```sql
DESCRIBE SELECT * FROM sales_2024.parquet;
```

## Join Parquet with CSV

Got a Parquet data export and a CSV lookup table? Open both in PondPilot and join them:

```sql
SELECT s.*, r.region_name
FROM sales_2024.parquet s
JOIN regions.csv r ON s.region_id = r.id;
```

Mix and match file formats in the same query session.

## Export Results

Query results can be exported back to CSV for sharing with colleagues who prefer spreadsheets. Run your analysis in SQL, share the output in whatever format works.

## Privacy First

Your Parquet files stay on your machine. PondPilot has zero backend — no server receives your data, ever. This matters when you're working with production data exports or sensitive datasets.

## Try It Now

[Open PondPilot](https://app.pondpilot.io) and query your first Parquet file. Free, open source, no account required.
