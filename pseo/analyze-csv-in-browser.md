---
layout: page
title: "Analyze CSV in Browser — No Upload, No Signup"
description: "Query and analyze CSV files directly in your browser with SQL. No server uploads, no accounts. Powered by DuckDB WASM."
permalink: /use-cases/analyze-csv-in-browser/
---


Drop a CSV file into PondPilot and start writing SQL against it immediately. No uploads to any server. No account creation. No waiting.

## How It Works

PondPilot runs [DuckDB](https://duckdb.org/) compiled to WebAssembly directly in your browser tab. When you open a CSV file, it's parsed and queryable locally — your data never leaves your machine.

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Drag your CSV file into the app (or use the file picker)
3. Write SQL queries against your data
4. Export results back to CSV when you're done

## Why SQL Instead of Spreadsheets?

Spreadsheets fall apart with large CSVs. Scrolling through 500K rows in Excel is painful. SQL lets you filter, aggregate, and join data in seconds:

```sql
SELECT department, COUNT(*) as headcount, AVG(salary) as avg_salary
FROM employees.csv
GROUP BY department
ORDER BY headcount DESC;
```

PondPilot gives you syntax highlighting, autocomplete, and instant results — all without installing anything.

## Multi-File Sessions

Working with related CSVs? Open multiple files in the same session and JOIN across them. Compare a customers table against an orders table, reconcile two exports, or merge data from different sources. All in SQL, all in your browser.

## Works Offline Too

PondPilot is a Progressive Web App. Install it once and it works without an internet connection. Perfect for analyzing sensitive data on an air-gapped machine or working on a flight.

## No Size Limits (Within Reason)

Since DuckDB WASM runs in your browser's memory, you can handle files much larger than typical web tools allow. We've seen users query multi-hundred-megabyte CSVs without issues on modern hardware.

## Get Started

Open [PondPilot App](https://app.pondpilot.io) and drop your first CSV. No signup, no trial period, no credit card. It's open source and free forever.

---

## Related

- [DuckDB CSV Query](/duckdb/csv-query/)
- [CSV to SQL Online](/use-cases/csv-to-sql-online/)
- [Browser SQL Analytics](/use-cases/browser-sql-analytics/)
