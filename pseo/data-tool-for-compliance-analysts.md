---
layout: page
title: "Data Tool for Compliance Analysts — Review Sensitive Exports Locally"
description: "Run SQL on access logs, transaction exports, and control samples without uploading to SaaS. PondPilot processes data in the browser, not the cloud."
permalink: /audience/data-tool-for-compliance-analysts/
---


Compliance and internal-audit analysts work with exports that carry real obligations: access logs, transaction monitoring pulls, HR records, privileged user lists. Sending any of it through a SaaS analytics tool creates a second custody problem. PondPilot keeps the file on your workstation and runs SQL against it in the browser.

## Nothing Leaves the Endpoint

DuckDB-WASM executes inside the browser. There's no upload, no server-side processing, no third-party account holding the data. For analysts working inside SOX, PCI, HIPAA, or SOC 2 control scopes, that architecture simplifies the handling story.

## Control Testing with SQL

A lot of control testing is SQL-shaped once the data is exported. Segregation-of-duties checks, terminated-user access reviews, privileged-action review, change-approval testing — all translate cleanly.

```sql
-- Terminated users with post-termination system access
SELECT
  h.user_id,
  h.termination_date,
  a.event_ts,
  a.system,
  a.action
FROM 'hr_terminations.csv' h
JOIN 'access_logs.csv' a USING (user_id)
WHERE a.event_ts > h.termination_date
ORDER BY a.event_ts;
```

Any row returned is a finding. Save the query as the workpaper evidence of the test procedure.

## Segregation-of-Duties Checks

```sql
-- Users who both created and approved the same vendor
SELECT DISTINCT c.vendor_id, c.created_by AS creator
FROM 'vendor_creates.csv' c
JOIN 'vendor_approvals.csv' a
  ON c.vendor_id = a.vendor_id
 AND c.created_by = a.approved_by;
```

## Sampling for Substantive Testing

Pull a reproducible sample for manual review, with a seed you can document:

```sql
SELECT *
FROM 'journal_entries.csv'
WHERE posting_date BETWEEN DATE '2024-01-01' AND DATE '2024-12-31'
ORDER BY hash(entry_id || '2024-audit-seed')
LIMIT 60;
```

Same seed, same sample — the test is reproducible by the external auditor or by next year's you.

## Large Logs, Modest Laptop

Access-log exports can hit tens of millions of rows. DuckDB's columnar engine handles that on a standard work laptop without a separate database.

## Audit-Friendly Evidence

A saved `.sql` file plus the input export is a clean workpaper: inputs, procedure, and result are all reviewable. No screenshots of a BI tool, no "I did some filtering in Excel" narrative.

## No Account, No Logs

PondPilot requires no signup. There's no vendor-side record of which files you opened or what you queried. That removes a category of questions from every risk review of your tooling.

## Works Offline

Install as a PWA and operate on a workstation without outbound connectivity. Useful when the data classification policy says the file cannot touch the network at all.

## Start a Review

[Open PondPilot](https://app.pondpilot.io) — local SQL for sensitive exports.

---

## Related

- [Data Tools for Journalists](/audience/data-tools-for-journalists/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Data Analysis Without Uploading](/privacy/data-analysis-without-uploading/)
