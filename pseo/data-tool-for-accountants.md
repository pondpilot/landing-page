---
layout: page
title: "Data Tool for Accountants — SQL on GL Exports, Client Data Stays Local"
description: "Run reconciliations and trial-balance checks on journal-entry CSVs in the browser. PondPilot keeps client data on your machine — no uploads."
permalink: /audience/data-tool-for-accountants/
---


Accounting work lives in exports. A general-ledger dump from NetSuite, a journal-entry CSV from QuickBooks, a trial balance from the client's bookkeeper. You need to reconcile, tie out, and test — without sending the client's books to a SaaS vendor. PondPilot is a local SQL workbench built for that.

## Client Data Doesn't Leave Your Machine

Engagement letters and confidentiality obligations make uploading client data a real problem. PondPilot processes everything in your browser via DuckDB-WASM. No file ever reaches a server, no account is required, no vendor can subpoena what it doesn't have.

## Journal-Entry Exports, Queried Directly

Drop a `gl_detail.csv` into [app.pondpilot.io](https://app.pondpilot.io) and start testing:

```sql
-- Debits must equal credits, per entry
SELECT
  entry_id,
  SUM(debit) AS total_debit,
  SUM(credit) AS total_credit,
  SUM(debit) - SUM(credit) AS imbalance
FROM 'gl_detail.csv'
GROUP BY entry_id
HAVING ROUND(SUM(debit) - SUM(credit), 2) <> 0
ORDER BY ABS(SUM(debit) - SUM(credit)) DESC;
```

## Trial Balance from the GL

Rebuild a trial balance from journal detail and compare to what the client reported:

```sql
SELECT
  account_number,
  account_name,
  SUM(debit) - SUM(credit) AS net_movement
FROM 'gl_detail.csv'
WHERE posting_date BETWEEN DATE '2024-01-01' AND DATE '2024-12-31'
GROUP BY account_number, account_name
ORDER BY account_number;
```

Join that against the client's submitted TB file and flag differences in one query.

## Reconciliation Queries

Bank reconciliations, intercompany matches, AR aging — all SQL-shaped problems:

```sql
-- Unmatched bank transactions
SELECT b.*
FROM 'bank.csv' b
LEFT JOIN 'gl_cash.csv' g
  ON b.amount = g.amount AND b.value_date = g.posting_date
WHERE g.entry_id IS NULL;
```

## Control Testing and Sampling

Pull a JE sample for testing — weekends, round-dollar postings, entries by users who shouldn't be posting:

```sql
SELECT *
FROM 'gl_detail.csv'
WHERE dayofweek(posting_date) IN (0, 6)
   OR amount % 1000 = 0
   OR posted_by IN ('admin', 'system');
```

## Large Ledgers Without a Database

Multi-year GL files with millions of lines open fine here. DuckDB is built for analytical scans and runs columnar operations that Excel can't handle at that size.

## Works Offline

Install as a PWA and run the full engagement on a locked-down laptop with no outbound network.

## Start the Engagement

[Open PondPilot](https://app.pondpilot.io) — SQL on client data, nothing uploaded.

---

## Related

- [Data Analysis for Startups](/audience/data-analysis-for-startups/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Excel Alternative for Data Analysis](/alternatives/excel-alternative-for-data-analysis/)
