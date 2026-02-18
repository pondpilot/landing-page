---
layout: page
title: "Convert Data Formats in the Browser — CSV, Parquet, JSON, SAS, Stata, SPSS"
description: "Convert between CSV, Parquet, JSON, Excel, DuckDB, SAS, Stata, and SPSS files entirely in your browser. No uploads, no installs."
permalink: /formats/convert-data-formats-browser/
---


PondPilot is a many-to-many data format converter that runs entirely in your browser. Open a file in any supported format, query or transform it with SQL, and export to any other format. No servers, no uploads, no accounts.

## Supported Formats

**Import:** CSV, Parquet, JSON, Excel (.xlsx), DuckDB, SAS (.sas7bdat), Stata (.dta), SPSS (.sav)

**Export:** CSV, Parquet, JSON, Excel

That's a lot of conversion paths. SAS to Parquet? Done. SPSS to CSV? Easy. Excel to JSON? Sure. Every combination works because PondPilot loads any input format into DuckDB's SQL engine and writes any output format from there.

## How It Works

PondPilot runs DuckDB as WebAssembly in your browser. Statistical formats (SAS, Stata, SPSS) are handled by [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat), an open-source extension maintained by the PondPilot team. Everything processes locally — your files never leave your machine.

## Transform During Conversion

This isn't a dumb file converter. You have a full SQL engine between input and output:

```sql
SELECT 
  TRIM(name) as name,
  amount::DECIMAL(10,2) as amount,
  STRFTIME(date_col, '%Y-%m-%d') as date
FROM input_data
WHERE amount > 0
```

Clean, filter, aggregate, join multiple files — then export the result.

## Why Not Use Python?

You could. But PondPilot is faster for ad-hoc conversions: open a browser tab, drop a file, export. No virtual environments, no `pip install`, no scripts to maintain. It's the path of least resistance when you just need to convert a file and move on.

## Privacy First

Data format conversion often involves sensitive files — healthcare data in SAS, survey responses in SPSS, financial data in Excel. PondPilot's client-side architecture means zero exposure. There's no server to breach because there is no server.

## Get Started

Open [app.pondpilot.io](https://app.pondpilot.io) and convert your first file.

---

## Related

- [Statistical Data Format Converter](/formats/statistical-data-format-converter/)
- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [Excel to Parquet Converter](/formats/excel-to-parquet-converter/)
