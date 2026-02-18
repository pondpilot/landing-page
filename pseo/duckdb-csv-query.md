---
layout: page
title: "DuckDB CSV Query — Query CSV Files with DuckDB SQL"
description: "Use DuckDB's SQL to query CSV files directly in your browser. Auto-detection, fast parsing, and full analytical SQL."
permalink: /duckdb/csv-query/
---


DuckDB's CSV reader is exceptional — it auto-detects delimiters, headers, and types, then lets you query the file with full analytical SQL. PondPilot brings this to your browser with zero setup.

## DuckDB's CSV Superpowers

DuckDB doesn't just read CSVs — it understands them:

- **Auto-detection:** Delimiters, quote characters, headers, and column types are inferred automatically
- **Fast parsing:** DuckDB's CSV reader is significantly faster than Python's csv module or pandas
- **SQL-native:** No loading step — reference the CSV file directly in your SQL

```sql
SELECT * FROM 'sales_data.csv' WHERE revenue > 10000 LIMIT 100;
```

## Why DuckDB for CSVs?

**vs. pandas:** No Python environment needed. DuckDB SQL is often more readable than pandas method chains for analytical queries.

**vs. Excel:** Handles millions of rows without crashing. SQL is more reproducible than point-and-click formulas.

**vs. SQLite:** DuckDB is columnar and optimized for analytical queries. Aggregations on large CSVs are dramatically faster.

## Multi-CSV Queries

Open several CSVs in PondPilot and join them:

```sql
SELECT o.order_id, o.total, c.name, c.segment
FROM orders.csv o
JOIN customers.csv c ON o.customer_id = c.id
WHERE c.segment = 'Enterprise';
```

DuckDB treats each file as a table. No `CREATE TABLE`, no `LOAD DATA` — just reference the filename.

## Handle Messy CSVs

Real-world CSVs are messy. DuckDB handles:

- Mixed delimiters (comma, tab, pipe, semicolon)
- Quoted fields with embedded newlines
- Different date formats
- UTF-8 and other encodings
- Files with or without headers

## Export Results

Query results can be exported back to CSV. Clean up messy data with SQL, then export a polished version.

## Try It

[Open PondPilot](https://app.pondpilot.io), drop a CSV, and experience DuckDB's CSV handling firsthand.

---

## Related

- [DuckDB Browser Tool](/duckdb/browser-tool/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [DuckDB Parquet Viewer](/duckdb/parquet-viewer/)
