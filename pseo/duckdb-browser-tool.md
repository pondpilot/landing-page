---
layout: page
title: "DuckDB Browser Tool — Run DuckDB in Your Browser"
h1: "Run DuckDB in your browser"
description: "Run DuckDB in your browser with PondPilot. Query local CSV, Parquet, JSON and Excel files with DuckDB SQL through DuckDB-WASM. There is nothing to install."
permalink: /duckdb/browser-tool/
---


DuckDB is a fast analytical database that can run inside a browser tab as WebAssembly. PondPilot gives you DuckDB in your browser with a SQL editor around it, so you can query the CSV, Parquet, JSON and Excel files on your machine without installing anything. If you only want to try the SQL dialect, start with the [DuckDB online playground](/duckdb/online-playground/).

## DuckDB WASM, Ready to Use

PondPilot bundles DuckDB compiled to WebAssembly. You get the same SQL engine that data engineers love, running directly in your browser tab. The full DuckDB feature set — analytical functions, nested types, Parquet support — all available from a web UI.

## Who This Is For

**DuckDB curious:** You've heard about DuckDB and want to try it without installing anything. PondPilot is the fastest way to get a feel for DuckDB's SQL dialect.

**Quick analysis:** You have a CSV and need answers now. Don't want to open a terminal, create a virtual environment, and write a Python script. Just drop the file and query.

**Sharing results:** Analyze data and share findings with teammates who don't have DuckDB installed locally.

## Full DuckDB SQL

PondPilot doesn't limit the SQL you can write. Everything DuckDB WASM supports, you can use:

```sql
-- Pivot table
PIVOT sales.csv ON quarter USING SUM(revenue) GROUP BY product;

-- List aggregation
SELECT department, LIST(employee_name) as team
FROM employees.csv
GROUP BY department;

-- Window functions
SELECT *, revenue - LAG(revenue) OVER (ORDER BY date) as daily_change
FROM daily_metrics.csv;
```

## Multi-Format Support

DuckDB natively reads CSV, Parquet, JSON, and its own `.duckdb` format. PondPilot supports all of them. Open multiple files and join across formats in a single query.

## Complements Your Local DuckDB Workflow

Use DuckDB CLI or Python for heavy lifting, PondPilot for quick visual exploration and ad-hoc queries. They speak the same SQL dialect, so queries are portable between them.

## FAQ

**Can DuckDB run in a browser?**
Yes. DuckDB-WASM is DuckDB compiled to WebAssembly, and PondPilot runs it inside a browser tab. Nothing is installed on your machine.

**Which files can I query with DuckDB in the browser?**
PondPilot opens local CSV, Parquet, JSON, Excel (.xlsx) and DuckDB database files, as well as Stata, SAS and SPSS files. It also queries remote files over HTTP(S) and S3, and Apache Iceberg catalogs.

**Does my data leave my machine?**
No. DuckDB-WASM reads and processes your files in the browser, on your own device, and the App never uploads them.

## Try DuckDB in Your Browser

[Open PondPilot](https://app.pondpilot.io) — no signup, free, open source.

---

## Related

- [DuckDB online playground](/duckdb/online-playground/)
- [DuckDB WASM SQL Editor](/duckdb/wasm-sql-editor/)
- [DuckDB CSV Query](/duckdb/csv-query/)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Can DuckDB run in a browser?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. DuckDB-WASM is DuckDB compiled to WebAssembly, and PondPilot runs it inside a browser tab. Nothing is installed on your machine."
      }
    },
    {
      "@type": "Question",
      "name": "Which files can I query with DuckDB in the browser?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "PondPilot opens local CSV, Parquet, JSON, Excel (.xlsx) and DuckDB database files, as well as Stata, SAS and SPSS files. It also queries remote files over HTTP(S) and S3, and Apache Iceberg catalogs."
      }
    },
    {
      "@type": "Question",
      "name": "Does my data leave my machine?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. DuckDB-WASM reads and processes your files in the browser, on your own device, and the App never uploads them."
      }
    }
  ]
}
</script>
