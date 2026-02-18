---
layout: default
title: "Open SPSS .sav Files in Your Browser — No SPSS License Needed"
description: "View and query SPSS .sav files in the browser with PondPilot. No IBM SPSS license, no uploads, no servers. Data stays local."
permalink: /formats/open-spss-files-in-browser/
---

# Open SPSS Files in Your Browser

IBM SPSS Statistics starts at over $1,000/year. If someone sent you an `.sav` file and you just need to see what's in it, that's an expensive peek. PondPilot opens SPSS `.sav` files directly in the browser — for free, with no software to install.

## How It Works

PondPilot uses [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat) to parse SPSS files natively in WebAssembly. Variable names, labels, value labels, and missing value definitions are all preserved. Your file never leaves your machine.

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drop in your `.sav` file
3. Browse variables, preview rows, or query with SQL

## SQL Instead of SPSS Syntax

If you know SQL, you already know how to analyze SPSS data in PondPilot:

```sql
SELECT gender, satisfaction_score, COUNT(*) as respondents
FROM survey
GROUP BY gender, satisfaction_score
ORDER BY gender, satisfaction_score
```

No need to learn SPSS syntax. No point-and-click menus. Just write the query you need.

## Export and Convert

Once your `.sav` file is loaded, export it to CSV, Parquet, JSON, or Excel. This is the fastest way to get SPSS data into a format that modern tools can work with — no Python scripts, no R packages, no hassle.

## Built for Sensitive Data

Survey data is almost always sensitive. PondPilot runs entirely client-side — there's no server processing, no cloud storage, no account required. Your IRB compliance stays intact because the data literally never leaves the browser.

## Common Use Cases

- **Reviewing shared datasets** from collaborators who use SPSS
- **Converting legacy SPSS files** to modern formats like Parquet
- **Quick exploration** before deciding whether to invest in a full SPSS license
- **Teaching and coursework** — students can work with real `.sav` files without university site licenses

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and open your `.sav` file.

---

## Related

- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [SPSS to CSV Converter](/formats/spss-to-csv-converter/)
- [Statistical Data Format Converter](/formats/statistical-data-format-converter/)
