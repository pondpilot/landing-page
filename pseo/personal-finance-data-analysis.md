---
layout: page
title: "Personal Finance Data Analysis — Private, Local, Free"
description: "Analyze your bank statements and financial data with SQL in your browser. Your money data never leaves your machine."
permalink: /use-cases/personal-finance-data-analysis/
---


Your bank lets you export transactions as CSV. Most analysis tools want you to upload that file to their servers. PondPilot doesn't — your financial data stays on your machine, period.

## Query Your Bank Statements with SQL

Export your transactions from your bank, drop the CSV into [PondPilot](https://app.pondpilot.io), and start asking questions:

```sql
SELECT
  strftime(date, '%Y-%m') as month,
  SUM(CASE WHEN amount < 0 THEN amount ELSE 0 END) as spending,
  SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) as income
FROM transactions.csv
GROUP BY month
ORDER BY month;
```

## Categorize Spending

Use SQL pattern matching to tag transactions:

```sql
SELECT *,
  CASE
    WHEN description ILIKE '%grocery%' OR description ILIKE '%whole foods%' THEN 'Groceries'
    WHEN description ILIKE '%uber%' OR description ILIKE '%lyft%' THEN 'Transport'
    WHEN description ILIKE '%netflix%' OR description ILIKE '%spotify%' THEN 'Subscriptions'
    ELSE 'Other'
  END as category
FROM transactions.csv;
```

No proprietary categorization engine. You control the rules.

## Why Privacy Matters Here

Financial data is some of the most sensitive data you have. SaaS budgeting tools like Mint (RIP) or YNAB require full access to your accounts or uploaded transaction files. PondPilot runs entirely in your browser using DuckDB WebAssembly. Zero servers, zero data collection.

## Combine Multiple Accounts

Export CSVs from different banks and query them together. Compare spending across accounts, track net worth over time, or reconcile credit card statements against bank debits.

## Works Offline

Install PondPilot as a PWA. Analyze your finances on a flight, in a café, or anywhere you'd rather not be on a network while looking at your bank data.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io) and drop in your first bank export. It's free, open source, and your data stays yours.

---

## Related

- [Private Data Exploration](/privacy/private-data-exploration/)
- [Data Analysis Without Uploading](/privacy/data-analysis-without-uploading/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
