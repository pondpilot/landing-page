---
layout: page
title: "Exploratory Data Analysis in the Browser — Profile, Query, Export"
description: "A full EDA workflow in the browser: profile the file with Sonar, query it with PondPilot, export clean results. No uploads, no setup."
permalink: /use-cases/exploratory-data-analysis-browser/
---


Exploratory data analysis is a loop: open a file, figure out what's in it, ask questions, export what's useful. The PondPilot toolchain runs that whole loop in the browser — no uploads, no environment setup, no account.

## The EDA Workflow

**1. Open the file.** Drag a CSV, Parquet, JSON, Excel, DuckDB, SAS, SPSS, or Stata file into the browser. DuckDB WebAssembly parses it locally.

**2. Profile it.** [Sonar](https://sonar.pondpilot.io) gives you column types, null rates, distinct counts, histograms, and top values in seconds. A findings panel surfaces data quality issues — high-null columns, candidate primary keys, constant columns — ranked by severity.

**3. Query it.** When profiling raises a question, hand the dataset off to [PondPilot](https://app.pondpilot.io) with one click for deeper SQL querying.

```sql
-- Which customer segments have the highest refund rate?
SELECT segment,
       COUNT(*) as orders,
       SUM(CASE WHEN refunded THEN 1 ELSE 0 END) as refunds,
       ROUND(100.0 * SUM(CASE WHEN refunded THEN 1 ELSE 0 END) / COUNT(*), 2) as pct
FROM orders.parquet
GROUP BY segment
ORDER BY pct DESC;
```

**4. Export.** Dump filtered results to CSV, Parquet, JSON, or Excel.

## Why Do EDA in the Browser?

**No setup friction.** No `pip install`, no virtualenv, no kernel dying halfway through. Open a tab and start.

**Privacy by default.** EDA happens on raw, unmassaged data — often the most sensitive kind. Sonar and PondPilot both run entirely in-browser via DuckDB WebAssembly. Files never leave your machine.

**Works on the formats you have.** You don't need to pre-convert a SAS file to CSV or an Excel workbook to Parquet. Drop it in.

**Handles real-world sizes.** DuckDB is an analytical engine. Files that choke Pandas or Excel are fine here.

## Profile First, Then Query

It's tempting to skip straight to SQL, but profiling first saves time. Sonar tells you which columns are mostly null, which are constant, which are candidate keys, and which have suspicious distributions. Those answers shape better queries.

## Try the Loop

[Start with Sonar](https://sonar.pondpilot.io) to profile, or [open PondPilot](https://app.pondpilot.io) to jump straight to SQL. Free, open source, fully local.

---

## Related

- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Data Quality Check Tool](/tools/data-quality-check-tool/)
- [Compare Datasets in Browser](/use-cases/compare-datasets-in-browser/)
