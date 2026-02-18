---
layout: page
title: "Convert JSON to CSV Online — Query First, Then Export"
description: "Convert JSON files to CSV in the browser with SQL transformations. Flatten nested objects, filter rows, select fields. No uploads."
permalink: /formats/json-to-csv-converter/
---


JSON is great for APIs and developers. CSV is great for spreadsheets and non-technical stakeholders. PondPilot bridges the two — with SQL in between so you can flatten, filter, and reshape before exporting.

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your JSON file (or newline-delimited JSON)
3. Query and transform with SQL
4. Export to CSV

Everything runs in your browser via DuckDB WebAssembly. No server, no upload, no waiting.

## Flatten Nested JSON with SQL

The hard part of JSON-to-CSV isn't the conversion — it's the flattening. DuckDB's JSON support handles nested objects and arrays:

```sql
SELECT 
  data->>'name' as name,
  data->>'email' as email,
  data->'address'->>'city' as city,
  UNNEST(data->'tags') as tag
FROM json_data
```

Extract nested fields, unnest arrays, and build a flat table — all in SQL.

## Handles Large Files

DuckDB is built for analytical workloads. It can handle JSON files that would crash a web-based converter or take forever in a Python script. If it fits in your browser's memory, PondPilot can process it.

## Newline-Delimited JSON (NDJSON)

PondPilot handles both regular JSON arrays and NDJSON (one JSON object per line). NDJSON is common in log files, API exports, and streaming data pipelines. Just drop the file in — DuckDB auto-detects the format.

## Privacy

API exports and log files often contain tokens, user data, or internal system information. PondPilot processes everything locally. Your JSON file stays on your machine.

## Beyond CSV

While you're at it, you can also export to Parquet (much better for large datasets), Excel (for that colleague who insists), or keep it in DuckDB format for later analysis.

## Get Started

Open [app.pondpilot.io](https://app.pondpilot.io) and convert your JSON file.

---

## Related

- [DuckDB JSON Query](/tools/duckdb-json-query/)
- [Data Format Converter](/formats/data-format-converter-browser/)
- [Excel to Parquet Converter](/formats/excel-to-parquet-converter/)
