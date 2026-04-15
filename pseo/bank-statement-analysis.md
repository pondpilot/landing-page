---
layout: page
title: "Bank Statement Analysis — Categorize and Total Transactions Locally"
description: "Analyze personal or business bank CSV exports with SQL in your browser. Categorize transactions, compute monthly totals, flag outliers — all private."
permalink: /use-cases/bank-statement-analysis/
---


Your bank gives you a CSV export. Your accountant wants monthly totals. Your budget app wants you to hand over credentials to a service you've never heard of. PondPilot is a third option: SQL on the file, in your browser, no upload.

## Don't Upload Bank Data to Random Sites

This is the core pitch. Bank transaction history reveals where you live, where you shop, who you pay, and what you earn. Uploading that to a free web tool — or pasting it into a chatbot — is a bad trade for "quick analysis". PondPilot runs DuckDB in WebAssembly inside your browser tab. The CSV doesn't leave your machine.

## Monthly Income and Spending

```sql
SELECT
  strftime(date, '%Y-%m') as month,
  SUM(CASE WHEN amount < 0 THEN -amount ELSE 0 END) as spending,
  SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) as income,
  SUM(amount) as net
FROM transactions.csv
GROUP BY month
ORDER BY month;
```

Drop your export into [PondPilot](https://app.pondpilot.io) and you have a twelve-month cash-flow table in one query.

## Categorize Transactions

No proprietary "AI categorization" — just SQL patterns you control:

```sql
SELECT
  date,
  amount,
  description,
  CASE
    WHEN description ILIKE '%whole foods%' OR description ILIKE '%trader joe%' THEN 'Groceries'
    WHEN description ILIKE '%uber%' OR description ILIKE '%lyft%' THEN 'Transport'
    WHEN description ILIKE '%aws%' OR description ILIKE '%stripe%' THEN 'Business'
    WHEN description ILIKE '%rent%' OR description ILIKE '%mortgage%' THEN 'Housing'
    ELSE 'Other'
  END as category
FROM transactions.csv;
```

Tweak the rules, re-run, done. Save the query to reuse next month.

## Flag Outliers

Useful for small-business accounts or catching fraud on a personal card:

```sql
WITH stats AS (
  SELECT AVG(amount) as mean_amt, STDDEV(amount) as std_amt
  FROM transactions.csv WHERE amount < 0
)
SELECT t.*
FROM transactions.csv t, stats
WHERE t.amount < 0
  AND ABS(t.amount - stats.mean_amt) > 3 * stats.std_amt
ORDER BY t.amount;
```

Anything more than three standard deviations from your average outflow surfaces immediately.

## Combine Accounts

Export CSVs from multiple banks or cards. Open them together in one PondPilot session, `UNION ALL` the relevant columns, and analyze total household or business cash flow across accounts.

## Works Offline

Install PondPilot as a PWA once, then use it without a network connection. Analyze finances on a flight or on a coffee-shop Wi-Fi you don't trust.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io). Free, open source, no signup, no data collection.

---

## Related

- [Personal Finance Data Analysis](/use-cases/personal-finance-data-analysis/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Private Data Exploration](/privacy/private-data-exploration/)
