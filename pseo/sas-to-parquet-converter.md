---
layout: default
title: "Convert SAS to Parquet Online — Modernize Legacy Data"
description: "Convert .sas7bdat files to Parquet in the browser. No SAS license, no servers. Migrate legacy SAS data to a modern columnar format."
permalink: /formats/sas-to-parquet-converter/
---

# SAS to Parquet Converter

Parquet is the standard for modern data infrastructure. SAS `.sas7bdat` is a legacy format tied to expensive proprietary software. PondPilot bridges the gap — convert SAS files to Parquet directly in your browser, no license required.

## Why Convert SAS to Parquet?

- **Columnar storage** — Parquet files are dramatically smaller and faster to query
- **Universal compatibility** — works with Spark, DuckDB, Pandas, Polars, BigQuery, Snowflake
- **Typed columns** — preserves data types better than CSV
- **Free from vendor lock-in** — no SAS installation needed to read the output

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.sas7bdat` file
3. Optionally transform with SQL (rename columns, filter rows, cast types)
4. Export as Parquet

PondPilot uses [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat) to parse SAS files and DuckDB's native Parquet writer for output. The entire pipeline runs client-side via WebAssembly.

## Transform During Conversion

This is where PondPilot shines compared to blind conversion scripts. You can clean up the data during conversion:

```sql
SELECT
  LOWER(region) as region,
  amount::DOUBLE as amount,
  date_col::DATE as event_date
FROM sas_data
WHERE region IS NOT NULL
```

Rename columns, fix types, filter junk — all before the Parquet file is written.

## Data Migration Use Case

If your organization is moving off SAS, PondPilot is a quick way to convert individual datasets without standing up a conversion pipeline. Analysts can self-serve: open the SAS file, verify the data looks right, export to Parquet, and upload to the new system.

## Privacy

SAS datasets in healthcare and pharma often contain protected health information. PondPilot runs entirely in your browser — nothing is uploaded, nothing is logged. Your data stays on your machine.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and convert your first SAS file to Parquet.

---

## Related

- [SAS to CSV Converter](/formats/sas-to-csv-converter/)
- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [Excel to Parquet Converter](/formats/excel-to-parquet-converter/)
