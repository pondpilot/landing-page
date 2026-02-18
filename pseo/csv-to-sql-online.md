---
layout: default
title: "CSV to SQL Online — Query Spreadsheet Data Instantly"
description: "Convert CSV files into queryable SQL tables in your browser. No upload, no conversion step — just drop and query."
permalink: /use-cases/csv-to-sql-online/
---

# CSV to SQL Online

You have a CSV. You want to query it with SQL. PondPilot skips the conversion step — drop a CSV file and it's immediately a SQL table.

## No Conversion Needed

Traditional "CSV to SQL" tools generate CREATE TABLE and INSERT statements. That's tedious and unnecessary. DuckDB reads CSV files directly as tables:

```sql
SELECT * FROM my_data.csv WHERE status = 'active';
```

No schema definition, no import wizard, no waiting. DuckDB auto-detects column types, delimiters, and headers.

## Real SQL on Real Data

Once your CSV is loaded, you have the full power of DuckDB SQL:

```sql
-- Aggregate
SELECT category, COUNT(*), AVG(price) FROM products.csv GROUP BY category;

-- Filter with complex conditions
SELECT * FROM logs.csv
WHERE timestamp BETWEEN '2024-01-01' AND '2024-03-31'
  AND level IN ('ERROR', 'WARN');

-- Window functions
SELECT *, ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) as rank
FROM employees.csv;
```

## Multiple CSVs = Multiple Tables

Open several CSV files and join them as if they were database tables:

```sql
SELECT o.*, c.company_name
FROM orders.csv o
JOIN customers.csv c ON o.customer_id = c.id;
```

## Export Results as CSV

Run a complex query and export the results back to CSV. Clean, filter, and reshape your data with SQL, then share the output.

## Privacy Guaranteed

Your CSV files stay on your machine. PondPilot runs DuckDB WASM in your browser — no server ever sees your data.

## Works on Any Device

PondPilot runs in any modern browser. No software to install, no Python to configure, no database to set up.

## Try It Now

[Open PondPilot](https://app.pondpilot.io) and drop a CSV file to start querying.

---

## Related

- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [DuckDB CSV Query](/duckdb/csv-query/)
- [SQL Data Cleaning Tool](/use-cases/sql-data-cleaning-tool/)
