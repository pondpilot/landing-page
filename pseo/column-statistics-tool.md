---
layout: page
title: "Column Statistics Tool — Per-Column Stats Without Pandas"
description: "See histograms, null rates, distinct counts, and top values for every column in your dataset. No Pandas, no notebook — just drop a file."
permalink: /tools/column-statistics-tool/
---


You have a file. You want to know, per column, how many nulls there are, how many distinct values, what the distribution looks like, and what the top categories are. You could spin up Jupyter, load Pandas, and write `df.describe()` plus a handful of `value_counts()` calls. Or you could drop the file into Sonar and have all of it on screen in seconds.

## Stats Per Column

For every column in your dataset, Sonar computes:

- **Type** (integer, decimal, string, date, boolean)
- **Null count and null rate**
- **Distinct value count**
- **Histogram** for numeric columns
- **Top values with frequency bars** for categorical columns
- **Min, max, mean** where applicable

No `import pandas as pd`. No kernel to restart. No waiting on a `df = pd.read_csv(...)` call that runs out of memory on a 2 GB file.

## Why Not Pandas?

Pandas is great, but it's overkill for "what's in this file?" You load the whole frame into memory, you write boilerplate, and you still have to render the histograms yourself. For quick column-level inspection, a dedicated profiling UI is faster.

Sonar uses DuckDB under the hood, which is column-oriented and streams aggregates efficiently. Files that make Pandas swap are comfortable for DuckDB.

## Works on the Formats You Actually Have

CSV, TSV, Parquet, JSON, JSONL, Excel, DuckDB databases, SAS, SPSS, Stata. Drop the file in — Sonar figures out the rest.

## Findings Highlight What Matters

Beyond raw stats, Sonar's findings engine ranks columns by data quality issues — high null rates, constant columns, candidate primary keys. You see which columns deserve attention without scrolling through all of them.

## Everything Stays Local

Sonar runs in the browser tab. Your data is not uploaded, not logged, not processed on a server. Close the tab and it's gone.

## Try It

[Launch Sonar](https://sonar.pondpilot.io) and see column statistics for your dataset in seconds.

---

## Related

- [Data Quality Check Tool](/tools/data-quality-check-tool/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Jupyter Notebook Alternative for SQL](/alternatives/jupyter-notebook-alternative-for-sql/)
