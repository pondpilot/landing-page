---
layout: page
title: "Open Stata .dta Files in Your Browser — Free, No License"
description: "View and query Stata .dta files directly in the browser with PondPilot. No Stata license required. Data stays on your machine."
permalink: /formats/open-stata-files-in-browser/
---


Got a `.dta` file but no Stata license? You're not alone. Stata is standard in economics and social science research, but the software costs hundreds to thousands of dollars. Sometimes you just need to inspect a dataset a colleague shared.

PondPilot reads Stata `.dta` files natively in the browser — no installation, no license, no data uploads.

## How It Works

PondPilot integrates [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat), a DuckDB extension for reading statistical file formats. It handles Stata versions 104 through 119 (Stata 8 through Stata 18), including variable labels and value labels. Everything runs client-side via WebAssembly.

1. Go to [app.pondpilot.io](https://app.pondpilot.io)
2. Open your `.dta` file
3. Explore the schema, preview data, or run SQL queries

## Query Stata Data with SQL

Don't just view it — analyze it. DuckDB gives you a full SQL engine:

```sql
SELECT education_level, AVG(income) as mean_income, COUNT(*) as n
FROM survey_data
WHERE age BETWEEN 25 AND 65
GROUP BY education_level
```

Window functions, subqueries, CTEs — all available. It's often faster than Stata itself for exploratory analysis.

## Convert to Other Formats

Need to get that `.dta` into CSV for Excel? Or Parquet for your data pipeline? PondPilot lets you export to CSV, Parquet, JSON, or Excel with a couple of clicks. No scripting required.

## Privacy by Design

Research datasets often contain PII or sensitive survey responses. PondPilot processes everything locally in your browser. No server ever sees your data. No accounts, no telemetry, no tracking.

## For Researchers and Grad Students

If you're reviewing datasets for a meta-analysis, checking replication data, or just need to peek at what's in a `.dta` file before committing to a Stata license — PondPilot is the fastest path from file to insight.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and drag in your `.dta` file.

---

## Related

- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [Open SPSS Files in Browser](/formats/open-spss-files-in-browser/)
- [Stata to CSV Converter](/formats/stata-to-csv-converter/)
