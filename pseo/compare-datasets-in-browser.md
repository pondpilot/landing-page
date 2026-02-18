---
layout: default
title: "Compare Datasets in Browser — Diff CSV, Parquet, JSON"
description: "Compare two datasets side by side using SQL in your browser. Find differences, reconcile data, and validate changes without uploading anything."
permalink: /use-cases/compare-datasets-in-browser/
---

# Compare Datasets in Your Browser

Need to diff two CSV exports? Reconcile last month's report against this month's? Validate that a data migration didn't drop rows? PondPilot makes dataset comparison straightforward with SQL.

## Open Both Files, Write SQL

Open two files in the same PondPilot session and use SQL to find differences:

```sql
-- Rows in new export but not in old
SELECT * FROM new_export.csv
EXCEPT
SELECT * FROM old_export.csv;
```

```sql
-- Row counts by status in both
SELECT 'old' as source, status, COUNT(*) FROM old.csv GROUP BY status
UNION ALL
SELECT 'new' as source, status, COUNT(*) FROM new.csv GROUP BY status
ORDER BY status, source;
```

No diffing tool with weird UIs. Just SQL against your actual data.

## Common Comparison Workflows

**Data migration validation:** Export before and after, query for missing or changed records.

**Report reconciliation:** Compare monthly exports to catch discrepancies early.

**Schema drift detection:** Use `DESCRIBE` on both files to spot column changes.

**Deduplication:** Find duplicate records across or within datasets using `GROUP BY` and `HAVING`.

## Mix File Formats

Your old export is CSV and the new one is Parquet? No problem. PondPilot treats all supported formats as queryable tables. Join a CSV against a Parquet file in the same query.

## All Local, All Private

Both files stay on your machine. PondPilot has no backend server — DuckDB runs as WebAssembly in your browser. This matters when you're comparing production data or sensitive records.

## Export the Diff

Found the differences? Export the query results to CSV and share with your team. Or keep iterating with more queries until you've fully understood what changed.

## Get Started

[Open PondPilot](https://app.pondpilot.io), drop both files in, and start comparing. Free, private, no account needed.
