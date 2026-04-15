---
layout: page
title: "ORC Viewer Online — Open .orc Files in Your Browser"
description: "View ORC files online via DuckDB WebAssembly. Browse schemas, run SQL, export to other formats. No uploads."
permalink: /formats/orc-viewer-online/
---


ORC files live deep in the Hadoop and Hive ecosystems. They're compact and columnar, but inspecting one usually means spinning up a JVM or pulling in PyArrow. PondPilot opens `.orc` files directly in the browser.

## How to View

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.orc` file
3. Instantly see the schema and a data preview
4. Query with SQL

The file is read in place via DuckDB WebAssembly. Nothing is uploaded.

## Full SQL on ORC

Most ORC viewers just show rows. PondPilot gives you DuckDB's full analytical SQL dialect on top of your ORC data:

```sql
SELECT
  region,
  COUNT(*) AS rows,
  SUM(amount) AS total
FROM 'warehouse.orc'
WHERE event_date >= DATE '2024-01-01'
GROUP BY region
ORDER BY total DESC;
```

Aggregations, window functions, joins between ORC and other files — all available.

## Schema Inspection

ORC files carry detailed type and statistics metadata. The schema panel surfaces:

- Column names and types
- Nested struct, list, and map types
- Nullability

Useful when you receive an ORC file from a Hive/Spark pipeline and need to understand what's inside before writing queries.

## Export to Something More Portable

ORC is a fine storage format, but not everyone can read it. PondPilot lets you pull data out and export it as Parquet, CSV, JSON, or Excel — whatever your downstream tool accepts.

## Handles Compressed ORC

ORC files are typically ZLIB or ZSTD compressed. DuckDB's ORC reader handles compression transparently.

## Privacy

ORC files from a data warehouse can contain anything — customer data, transactional records, internal metrics. PondPilot processes everything in-browser. No server sees your file.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and open your ORC file.

---

## Related

- [Parquet Viewer Online](/formats/parquet-viewer-online/)
- [Arrow / Feather Viewer](/formats/arrow-feather-viewer/)
- [Data Format Converter](/formats/data-format-converter-browser/)
