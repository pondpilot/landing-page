---
layout: page
title: "DuckDB JSON Query — Query JSON with SQL in Browser"
description: "Query JSON files with DuckDB SQL in your browser. Flatten nested data, filter arrays, join with CSV. No server, no upload."
permalink: /duckdb/json-query/
---


JSON is everywhere — API responses, log files, NoSQL exports. DuckDB's JSON support is best-in-class, and PondPilot puts it in your browser.

## Native JSON Support

DuckDB treats JSON as a first-class data type. No parsing hacks, no string manipulation:

```sql
SELECT
  data->>'user_id' as user_id,
  data->>'event' as event,
  data->'metadata'->>'source' as source
FROM events.json
WHERE data->>'event' = 'purchase';
```

## Flatten and Transform

Nested JSON becomes queryable tables with `UNNEST`:

```sql
SELECT
  order_id,
  item.value->>'product' as product,
  CAST(item.value->>'quantity' AS INTEGER) as qty
FROM orders.json, UNNEST(json_extract(data, '$.items')) as item;
```

Transform deeply nested structures into flat, analyzable rows — all with SQL.

## NDJSON (Newline-Delimited JSON)

Log files and streaming exports often use NDJSON format — one JSON object per line. DuckDB reads these natively. Drop your NDJSON file into PondPilot and each line becomes a queryable row.

## Join JSON with Other Formats

Have a JSON export from one system and a CSV from another? Open both and join them:

```sql
SELECT j.data->>'name', c.department
FROM api_users.json j
JOIN departments.csv c ON j.data->>'dept_id' = CAST(c.id AS VARCHAR);
```

## Schema Discovery

Not sure what's in a JSON file? Let DuckDB figure it out:

```sql
SELECT json_keys(data) FROM events.json LIMIT 1;
```

Discover the structure before writing your analysis queries.

## Handle Complex JSON Structures

Real-world JSON is rarely flat. API responses nest objects inside arrays inside objects. DuckDB handles recursive extraction, so you can reach deeply nested fields in a single query without writing custom parsers. Combined with PondPilot's instant file loading, you can iterate on complex JSON structures interactively — adjust your query, see results immediately, and refine until you get the exact output you need. This workflow replaces fragile Python scripts or jq pipelines with readable SQL that anyone on your team can understand and modify.

## All Local

Your JSON files stay on your machine. PondPilot processes everything in your browser via DuckDB WASM. No server, no uploads.

## Try It

[Open PondPilot](https://app.pondpilot.io) and query your JSON files with SQL.

---

## Related

- [Explore JSON Data Locally](/use-cases/explore-json-data-locally/)
- [DuckDB Browser Tool](/duckdb/browser-tool/)
- [DuckDB WASM SQL Editor](/duckdb/wasm-sql-editor/)
