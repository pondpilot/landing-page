---
layout: default
title: "Statistical Data Format Converter — SAS, Stata, SPSS to CSV/Parquet"
description: "Convert between SAS, Stata, SPSS, CSV, Parquet, and more in the browser. No licenses, no uploads. Open source and privacy-first."
permalink: /formats/statistical-data-format-converter/
---

# Statistical Data Format Converter

SAS, Stata, and SPSS have been the backbone of academic and government research for decades. But their file formats are proprietary, and the licenses are expensive. PondPilot reads all three — and converts them to modern, open formats — entirely in your browser.

## Supported Statistical Formats

| Format | Extension | Read | Write To |
|--------|-----------|------|----------|
| SAS | .sas7bdat | ✅ | CSV, Parquet, JSON, Excel |
| Stata | .dta | ✅ | CSV, Parquet, JSON, Excel |
| SPSS | .sav | ✅ | CSV, Parquet, JSON, Excel |

All three formats are parsed by [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat), an open-source DuckDB extension maintained by the PondPilot team. It runs in WebAssembly — no server-side processing.

## The License Problem

A SAS license can cost $10,000+/year. Stata ranges from $400 to $1,600. SPSS starts at $1,000+/year. If you just need to view or convert files in these formats, you shouldn't need to pay for the full software suite. PondPilot is free and open source.

## How to Convert

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drag in your `.sas7bdat`, `.dta`, or `.sav` file
3. Inspect the data, run SQL queries if needed
4. Export to your desired format

## SQL-Powered Transformation

PondPilot isn't just a blind converter. With DuckDB's SQL engine, you can clean and reshape data during conversion:

```sql
SELECT patient_id, diagnosis_code, visit_date
FROM clinical_data
WHERE visit_date >= '2020-01-01'
ORDER BY patient_id, visit_date
```

Filter rows, select columns, rename variables, aggregate — then export the clean result.

## Privacy for Sensitive Research Data

Statistical data files often contain protected health information, survey PII, or classified government data. PondPilot processes everything in your browser's memory. Nothing is uploaded, nothing is logged, nothing leaves your machine.

## Get Started

Open [app.pondpilot.io](https://app.pondpilot.io) and convert your statistical data files.

---

## Related

- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [Open Stata Files in Browser](/formats/open-stata-files-in-browser/)
- [Open SPSS Files in Browser](/formats/open-spss-files-in-browser/)
