---
layout: page
title: "Explore JSON Data Locally with SQL"
description: "Query JSON files with SQL in your browser. Flatten nested structures, filter arrays, and export results. No server, no uploads."
permalink: /use-cases/explore-json-data-locally/
---


API responses, log files, config exports — JSON is everywhere. But exploring nested JSON in a text editor is tedious. PondPilot lets you query JSON files with SQL, locally in your browser.

## SQL on JSON, No Scripting

Forget writing Python scripts to parse JSON. DuckDB handles nested JSON natively:

```sql
SELECT
  json->>'name' as user_name,
  json->>'email' as email,
  json->'address'->>'city' as city
FROM events.json
WHERE json->>'status' = 'active';
```

PondPilot runs DuckDB in WebAssembly, so this all happens in your browser tab. Your JSON files stay on your machine.

## Flatten Nested Structures

DuckDB's `UNNEST` makes quick work of arrays and nested objects:

```sql
SELECT id, UNNEST(items) as item
FROM orders.json;
```

Turn deeply nested JSON into flat, queryable tables without writing a single line of transformation code.

## Handle Large JSON Files

Browser-based doesn't mean toy-sized. DuckDB WASM handles JSON files that would choke a web-based JSON viewer. Load multi-megabyte API dumps and query them efficiently.

## Newline-Delimited JSON (NDJSON)

Working with log files or streaming data exports in NDJSON format? PondPilot handles those too. Each line is a row, ready for SQL.

## Join JSON with Other Formats

Open a JSON file alongside a CSV and join them:

```sql
SELECT j.*, c.category_name
FROM products.json j
JOIN categories.csv c ON j->>'category_id' = CAST(c.id AS VARCHAR);
```

## Export Clean Results

Once you've flattened and filtered your JSON data, export the results as CSV. Great for sharing with non-technical teammates who need the data in a spreadsheet.

## Try It

[Open PondPilot](https://app.pondpilot.io), drop a JSON file, and start querying. No signup, no upload, no backend.

---

## Related

- [DuckDB JSON Query](/duckdb/json-query/)
- [Local Data Analysis Tool](/privacy/local-data-analysis-tool/)
- [Browser SQL Analytics](/use-cases/browser-sql-analytics/)
