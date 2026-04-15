---
layout: page
title: "Convert CSV to JSON Online — SQL-Powered, In-Browser"
description: "Convert CSV files to JSON in your browser. Filter rows, reshape records, and build nested structures with SQL. No uploads."
permalink: /formats/csv-to-json-converter/
---


Need to turn a CSV into JSON for an API, a config file, or a frontend fixture? PondPilot converts CSV to JSON directly in the browser, with SQL in between so you can filter and reshape before export.

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.csv` file
3. Query and reshape with SQL
4. Export as JSON

Everything runs locally via DuckDB WebAssembly. No server, no upload.

## Filter Rows Before Exporting

Most CSV-to-JSON tools dump every row. That's rarely what you want — JSON payloads are read by humans and machines that care about size.

```sql
SELECT id, name, email
FROM read_csv_auto('contacts.csv')
WHERE subscribed = true
  AND email IS NOT NULL
```

Export only the rows and columns you actually need.

## Build Nested Structures

JSON isn't flat. DuckDB lets you construct nested objects and arrays on the way out:

```sql
SELECT
  user_id,
  {'first': first_name, 'last': last_name} AS name,
  list(tag) AS tags
FROM read_csv_auto('users.csv')
GROUP BY user_id, first_name, last_name
```

Turn a flat CSV into a JSON shape that matches your API contract.

## NDJSON or JSON Array

Export as a standard JSON array or as newline-delimited JSON (NDJSON), whichever your downstream tool expects. NDJSON is nicer for streaming and log pipelines.

## Privacy

CSVs exported from CRMs, analytics tools, or internal dashboards often contain names, emails, and account data. PondPilot processes everything in-browser, so nothing is uploaded.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and convert your CSV to JSON.

---

## Related

- [JSON to CSV Converter](/formats/json-to-csv-converter/)
- [CSV to SQL Online](/use-cases/csv-to-sql-online/)
- [Data Format Converter](/formats/data-format-converter-browser/)
