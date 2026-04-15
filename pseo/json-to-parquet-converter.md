---
layout: page
title: "Convert JSON to Parquet Online — Flatten and Type in the Browser"
description: "Convert JSON or NDJSON files to Parquet in your browser. Flatten nested structures and fix types with SQL. No uploads."
permalink: /formats/json-to-parquet-converter/
---


JSON is easy to produce and painful to analyze. Parquet is the opposite. PondPilot converts JSON to Parquet in the browser — flattening nested structures and locking in types along the way.

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.json` or `.ndjson` file
3. Flatten and type-check with SQL
4. Export as Parquet

The conversion runs entirely in your browser via DuckDB WebAssembly. Your JSON file stays local.

## Schema Inference

DuckDB scans your JSON and infers a schema — column names, types, and nested structure. For large files it samples; for small ones it reads everything. You can inspect the inferred schema before exporting:

```sql
DESCRIBE SELECT * FROM read_json_auto('events.json');
```

If the inference got something wrong (numbers parsed as strings, dates as text), you can fix it before export.

## Flatten Nested JSON

API responses and log exports are usually deeply nested. Parquet prefers flat, typed columns. SQL bridges the gap:

```sql
SELECT
  id,
  created_at::TIMESTAMP AS created_at,
  user->>'id' AS user_id,
  user->>'country' AS country,
  UNNEST(events) AS event
FROM read_json_auto('payload.ndjson')
```

Extract the fields you care about, unnest arrays, and write out a flat Parquet file ready for analytics.

## Why Parquet?

- **Typed** — integers stay integers, timestamps stay timestamps
- **Small** — columnar compression typically beats gzipped JSON by a wide margin
- **Fast** — analytical engines read columns, not rows

## NDJSON Works Too

Newline-delimited JSON is common in logs and streaming exports. PondPilot handles both regular JSON arrays and NDJSON transparently.

## Privacy

Log exports and API dumps are often sensitive. PondPilot runs in your browser — the file never leaves your machine.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and convert your JSON to Parquet.

---

## Related

- [JSON to CSV Converter](/formats/json-to-csv-converter/)
- [DuckDB JSON Query](/duckdb/json-query/)
- [Parquet Viewer Online](/formats/parquet-viewer-online/)
