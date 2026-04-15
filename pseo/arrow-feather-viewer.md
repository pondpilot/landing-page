---
layout: page
title: "Arrow / Feather Viewer — Open .arrow and .feather Files in Browser"
description: "Open Arrow and Feather files in your browser via DuckDB. Zero-copy reads, full SQL, no uploads."
permalink: /formats/arrow-feather-viewer/
---


Arrow and Feather files are everywhere in the modern data stack — fast, columnar, language-neutral. They're also annoying to inspect without booting up Python or R. PondPilot opens `.arrow` and `.feather` files directly in your browser.

## Open Any Arrow or Feather File

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.arrow` or `.feather` file
3. Instantly see the schema and a data preview
4. Query with SQL

The file is read in place via DuckDB WebAssembly. No conversion, no import step, no upload.

## Zero-Copy, Fast

Arrow's whole point is zero-copy columnar data. DuckDB speaks Arrow natively, which means reads are efficient — the engine and the file format share the same memory layout. Large Arrow files open quickly because DuckDB only materializes the columns your query touches.

## Full SQL on Top

Most Arrow viewers show you a table and stop there. PondPilot gives you DuckDB's full analytical SQL:

```sql
SELECT
  date_trunc('day', event_ts) AS day,
  event_type,
  COUNT(*) AS n
FROM 'events.arrow'
GROUP BY 1, 2
ORDER BY 1 DESC, n DESC;
```

Aggregations, joins across files, window functions — all the things a plain viewer can't do.

## Feather v1 and v2

Feather started as a simple on-disk Arrow format and evolved into Feather v2 (essentially Arrow IPC). PondPilot handles both. If the file opens in PyArrow or R's `arrow` package, it opens here.

## Schema Inspection

Arrow files carry full type information — nested structs, lists, dictionaries, extension types. The schema panel shows all of it, which is invaluable when you receive a file and need to understand its shape before writing queries.

## Export to Other Formats

View Arrow, export Parquet, CSV, JSON, or Excel. Handy for sharing a slice with someone who doesn't live in the Arrow ecosystem.

## Privacy

Arrow files are often intermediate artifacts in data pipelines — they can contain anything. PondPilot processes everything in-browser. No server sees your file.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and open your Arrow or Feather file.

---

## Related

- [Parquet Viewer Online](/formats/parquet-viewer-online/)
- [Data Format Converter](/formats/data-format-converter-browser/)
- [DuckDB Browser Tool](/duckdb/browser-tool/)
