---
layout: page
title: "Private Healthcare Data Analysis — Clinical and Claims Data, Locally"
description: "Analyze clinical datasets, claims exports, and SAS/SPSS research files in your browser. PondPilot keeps PHI on your workstation."
permalink: /use-cases/healthcare-data-analysis-private/
---


Clinical researchers, health economists, and claims analysts work with some of the most sensitive data around. PondPilot gives you SQL over that data without sending a single row to a vendor — your files stay on your workstation.

## Claims and EHR Exports

Most health data arrives as CSV, Parquet, or fixed-width text. Drop it into [PondPilot](https://app.pondpilot.io) and query it with full DuckDB SQL:

```sql
SELECT
  diagnosis_code,
  COUNT(DISTINCT patient_id) as patients,
  AVG(total_paid) as avg_paid,
  SUM(total_paid) as total_spend
FROM claims_2025.parquet
WHERE service_date BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY diagnosis_code
ORDER BY total_spend DESC
LIMIT 25;
```

No upload. No cloud warehouse bill. No vendor sitting between you and PHI.

## SAS and SPSS Files for Research Cohorts

A lot of health research data still lives in SAS (`.sas7bdat`) and SPSS (`.sav`) files. DuckDB's [read_stat](https://github.com/mettekou/duckdb-read-stat) community extension loads both directly. Point PondPilot at the file and query it without round-tripping through a proprietary statistics package just to see the columns.

This is particularly useful for secondary analysis of public-use files (MEPS, NHANES, HCUP) and for inspecting collaborator-supplied research extracts before pulling them into a full analysis environment.

## Cohort Building, Locally

Window functions and CTEs cover most cohort logic — index events, washout periods, continuous enrollment, first-observed diagnoses. DuckDB gives you all of that. Your cohort definition stays on your machine, which matters when the cohort criteria themselves are sensitive.

## Join Across Sources

Open a claims CSV next to a member eligibility file and a provider roster. JOIN across all three in a single session. No ETL pipeline, no staging schema, no IT ticket.

## Why This Matters

Uploading PHI to a third-party SaaS tool — even "just for a quick look" — is the kind of thing that derails an IRB review, a DUA, or a compliance audit. PondPilot avoids the problem by design: there is no upload endpoint.

## Honest Caveats

This is a SQL exploration tool. It's not a statistical package, not a validated clinical platform, not a substitute for your analysis-of-record environment. Use it for exploration, cohort sizing, data QA, and ad-hoc questions.

## Start Querying

[Open PondPilot](https://app.pondpilot.io) and drop in your first file. Works offline once loaded.

---

## Related

- [HIPAA-Friendly Data Tool](/privacy/hipaa-compliant-data-tool/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Air-Gapped Data Analysis](/privacy/air-gapped-data-analysis/)
