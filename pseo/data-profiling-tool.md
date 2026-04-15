---
layout: page
title: "Data Profiling Tool — Instant Column Stats in Your Browser"
description: "Drop a file and get column types, null rates, distinct counts, and distributions in seconds. No uploads, no setup. Powered by Sonar."
permalink: /tools/data-profiling-tool/
---


Before you write a single query, you need to know what's in the file. Sonar is a data profiling tool that reads your dataset in the browser and shows column types, null rates, distinct counts, and distributions — no uploads, no account, no Python environment.

## What You Get in Seconds

Drop a CSV, Parquet, JSON, Excel, DuckDB, SAS, SPSS, or Stata file and Sonar profiles it:

- **Inferred types** per column (INT, DEC, STR, DATE, etc.)
- **Null counts and null rate** across the whole dataset
- **Distinct value counts** — spot candidate primary keys and constant columns
- **Min / max / mean** for numeric columns
- **Top values and frequency bars** for categorical columns
- **Row and column counts** at a glance

The overview shows up in seconds. Deeper statistics stream in progressively as they compute, so you don't wait for a full pass before you start looking.

## Findings, Not Just Numbers

Sonar runs 12+ deterministic rules over the profile and surfaces findings ranked by severity — columns with more than 50% nulls, candidate primary keys, constant columns, suspicious outliers. You see the problems before you go looking for them.

## In-Browser, No Uploads

Sonar runs entirely on your machine via DuckDB WebAssembly. The file is parsed in the browser tab — it never touches a server. That matters when you're profiling production exports, PII, or anything under a data use agreement.

## Compare Profiles Over Time

Export a baseline profile, then re-profile the next delivery. Sonar's Profile Compare mode highlights drift — new nulls, shifted top values, type changes — so you catch regressions before they hit your pipeline.

## Hand Off to SQL When You're Ready

Profiling answers "what's here?" When you're ready to ask "what does it mean?", Sonar hands the dataset off to the PondPilot App with one click for deeper SQL querying.

## Try Sonar

[Launch Sonar](https://sonar.pondpilot.io) and profile your first file. Free, open source, runs locally.

---

## Related

- [Data Quality Check Tool](/tools/data-quality-check-tool/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Compare Datasets in Browser](/use-cases/compare-datasets-in-browser/)
