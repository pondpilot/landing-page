---
layout: page
title: "HIPAA-Friendly Data Tool — No PHI Leaves Your Browser"
description: "Analyze PHI without sending it to a vendor. PondPilot runs SQL on your machine — no BAA required because we never receive your data."
permalink: /privacy/hipaa-compliant-data-tool/
---


HIPAA compliance is a property of workflows, not software labels. PondPilot is not "HIPAA certified" — there is no such certification. What PondPilot is: a SQL tool that never receives your data, which makes it easier to fit into HIPAA-compliant workflows.

## Why No BAA Is Needed

A Business Associate Agreement is required when a vendor handles Protected Health Information on your behalf. PondPilot doesn't handle your data. DuckDB runs as WebAssembly inside your browser tab. Your CSVs, Parquet files, and query results stay on your workstation.

No server processes PHI. No logs capture queries. No telemetry reports usage. There's nothing for a BAA to cover because we're not a business associate — we're a static web app your browser downloads and runs locally.

## What You Still Need to Do

We're honest about scope. Using PondPilot doesn't make your overall workflow HIPAA-compliant. You still need:

- Encrypted disks on the workstations running the browser
- Access controls on the machine itself
- Policies for how PHI files are obtained, stored, and deleted
- Your own risk analysis covering browser cache, downloads folder, and session state

PondPilot removes the "third-party vendor with access to PHI" line item from your risk register. The rest is still on you.

## Query PHI Without Uploading

```sql
SELECT patient_id, encounter_date, diagnosis_code, COUNT(*) as visit_count
FROM encounters.csv
WHERE encounter_date >= '2025-01-01'
GROUP BY patient_id, encounter_date, diagnosis_code
HAVING visit_count > 3;
```

Run the query, review the cohort, close the tab. No trace on anyone else's server.

## Auditable by Design

PondPilot is [open source](https://github.com/pondpilot). Your security officer can review the code, watch browser network traffic during use, and confirm that no data leaves the workstation. That's a much shorter audit than evaluating a cloud analytics vendor's SOC 2 report.

## Works on Locked-Down Networks

Install PondPilot as a PWA on a connected machine, then use it offline — on a segmented clinical network, inside a secure research enclave, or on a workstation with outbound traffic blocked. No "call home", no update pings.

## Get Started

[Open PondPilot](https://app.pondpilot.io). No account, no signup, no data collection. If your compliance team has questions, the code is on GitHub.

---

## Related

- [GDPR Compliant Data Tool](/privacy/gdpr-compliant-data-tool/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Air-Gapped Data Analysis](/privacy/air-gapped-data-analysis/)
