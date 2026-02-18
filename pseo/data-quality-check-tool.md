---
layout: default
title: "Data Quality Check Tool — Validate Data with SQL"
description: "Run data quality checks on CSV and Parquet files using SQL. Find nulls, duplicates, outliers, and schema issues in your browser."
permalink: /tools/data-quality-check-tool/
---

# Data Quality Check Tool

Before you trust a dataset, you need to check it. PondPilot lets you run data quality checks with SQL — find nulls, duplicates, type mismatches, and outliers without uploading data anywhere.

## Common Data Quality Checks in SQL

**Null analysis:**
```sql
SELECT
  COUNT(*) as total_rows,
  COUNT(*) - COUNT(email) as null_emails,
  COUNT(*) - COUNT(phone) as null_phones,
  ROUND(100.0 * (COUNT(*) - COUNT(email)) / COUNT(*), 1) as null_email_pct
FROM customers.csv;
```

**Duplicate detection:**
```sql
SELECT email, COUNT(*) as occurrences
FROM users.csv
GROUP BY email
HAVING COUNT(*) > 1;
```

**Range validation:**
```sql
SELECT * FROM transactions.csv
WHERE amount < 0 OR amount > 1000000
   OR date < '2020-01-01' OR date > CURRENT_DATE;
```

**Uniqueness check:**
```sql
SELECT COUNT(*) as total, COUNT(DISTINCT id) as unique_ids
FROM records.csv;
```

## Why SQL for Data Quality?

SQL is declarative and readable. Your quality checks double as documentation. Save the queries and re-run them next time you receive a data delivery. Better than a spreadsheet full of conditional formatting.

## Check Before You Load

Validating data before it enters your pipeline saves debugging time downstream. Drop a file into PondPilot, run your checks, and decide if the data is clean enough to proceed.

## Cross-File Validation

Open a reference dataset alongside the file you're checking:

```sql
-- Find customer IDs in orders that don't exist in customers
SELECT DISTINCT customer_id FROM orders.csv
WHERE customer_id NOT IN (SELECT id FROM customers.csv);
```

## Private by Default

Data quality checks often run against production data with PII. PondPilot processes everything in your browser — no data leaves your machine.

## Try It

[Open PondPilot](https://app.pondpilot.io) and validate your data with SQL. Free, private, no setup.

---

## Related

- [SQL Data Cleaning Tool](/use-cases/sql-data-cleaning-tool/)
- [Compare Datasets in Browser](/use-cases/compare-datasets-in-browser/)
- [Column-Level Lineage Tool](/tools/column-level-lineage-tool/)
