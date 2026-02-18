---
layout: default
title: "Parquet to CSV Converter — Convert in Browser with SQL"
description: "Convert Parquet files to CSV in your browser. Filter, transform, and export with SQL. No upload, no Python, no command line."
permalink: /use-cases/parquet-to-csv-converter/
---

# Parquet to CSV Converter

Need to convert a Parquet file to CSV? PondPilot does it in your browser — and unlike simple converters, you can filter and transform the data with SQL before exporting.

## More Than a Dumb Converter

Most Parquet-to-CSV tools do a blind conversion: every row, every column. PondPilot lets you be selective:

```sql
-- Export only what you need
SELECT customer_id, order_date, total
FROM large_dataset.parquet
WHERE order_date >= '2024-01-01'
ORDER BY total DESC;
```

Export the query results as CSV. You get a clean, focused file instead of a massive dump.

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop your Parquet file
3. Write a query (or just `SELECT * FROM file.parquet`)
4. Export results as CSV

Takes seconds. No Python environment, no `pyarrow`, no command line.

## Handle Large Files

DuckDB WASM reads Parquet files efficiently — it only loads the columns and row groups needed for your query. Even large Parquet files convert quickly because DuckDB skips data you didn't select.

## Inspect Before Converting

Not sure what's in the Parquet file? Check the schema first:

```sql
DESCRIBE SELECT * FROM mystery_file.parquet;
```

See column names and types, then decide what to include in your CSV export.

## Privacy

Your Parquet file stays on your machine. The conversion happens in your browser via DuckDB WebAssembly. No server processes your data.

## Free and Unlimited

No file size limits (beyond browser memory), no conversion quotas, no accounts. Convert as many files as you need.

## Try It

[Open PondPilot](https://app.pondpilot.io) and convert your Parquet files to CSV.
