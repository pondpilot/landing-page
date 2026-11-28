---
layout: page
title: "Open .sav Files Online: Free SPSS File Opener"
h1: "Open SPSS .sav files online, without SPSS"
description: "Free SAV file opener and SPSS viewer. Open a .sav file online in your browser, query it with SQL and export it to CSV or Excel. The file isn't uploaded."
permalink: /formats/open-spss-files-in-browser/
---


If someone sent you a `.sav` file and you don't have SPSS, you can open it online with PondPilot. Go to [app.pondpilot.io](https://app.pondpilot.io), add the file, and PondPilot shows its columns and rows as a table in a browser tab. PondPilot is free and open source, it needs no signup, and it reads the file on your computer instead of uploading it.

## How to open a .sav file

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

Once your `.sav` file is loaded, export it to CSV, Excel (.xlsx) or Parquet. This is the fastest way to get SPSS data into a format that modern tools can work with — no Python scripts, no R packages, no hassle.

## Built for Sensitive Data

Survey data is almost always sensitive. PondPilot runs entirely client-side — there's no server processing, no cloud storage, no account required. Your IRB compliance stays intact because the data literally never leaves the browser.

## Common Use Cases

- **Reviewing shared datasets** from collaborators who use SPSS
- **Converting legacy SPSS files** to modern formats like Parquet
- **Quick exploration** before deciding whether to invest in a full SPSS license
- **Teaching and coursework** — students can work with real `.sav` files without university site licenses

## FAQ

**How do I open a .sav file without SPSS?**
Open app.pondpilot.io in your browser, click “Add file” or press Ctrl+F, and choose the .sav file. You can also drag the file into the window. PondPilot shows the data as a table that you can browse or query with SQL.

**Which SPSS files can PondPilot open?**
PondPilot opens .sav files, compressed .zsav files and portable .por files. It reads them with duckdb-read-stat, an open-source DuckDB extension built on ReadStat.

**Is my .sav file uploaded anywhere?**
No. DuckDB-WASM reads and processes the file in your browser, on your own device, and the App never uploads it.

**Can I convert a .sav file to CSV or Excel?**
Yes. Export the table, or the result of a SQL query, as CSV, TSV, Excel (.xlsx), Parquet, SQL, XML or Markdown.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and open your `.sav` file.

---

## Related

- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [SPSS to CSV Converter](/formats/spss-to-csv-converter/)
- [Statistical Data Format Converter](/formats/statistical-data-format-converter/)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How do I open a .sav file without SPSS?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Open app.pondpilot.io in your browser, click “Add file” or press Ctrl+F, and choose the .sav file. You can also drag the file into the window. PondPilot shows the data as a table that you can browse or query with SQL."
      }
    },
    {
      "@type": "Question",
      "name": "Which SPSS files can PondPilot open?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "PondPilot opens .sav files, compressed .zsav files and portable .por files. It reads them with duckdb-read-stat, an open-source DuckDB extension built on ReadStat."
      }
    },
    {
      "@type": "Question",
      "name": "Is my .sav file uploaded anywhere?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. DuckDB-WASM reads and processes the file in your browser, on your own device, and the App never uploads it."
      }
    },
    {
      "@type": "Question",
      "name": "Can I convert a .sav file to CSV or Excel?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. Export the table, or the result of a SQL query, as CSV, TSV, Excel (.xlsx), Parquet, SQL, XML or Markdown."
      }
    }
  ]
}
</script>
