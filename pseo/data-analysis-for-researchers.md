---
layout: page
title: "Data Analysis for Researchers — Private SQL for Sensitive Datasets"
description: "Analyze clinical, survey, SPSS, and SAS data under DUAs without uploading. PondPilot runs SQL locally in the browser, with reproducible scripts."
permalink: /audience/data-analysis-for-researchers/
---


Academic research data frequently arrives with strings attached: a data-use agreement that forbids cloud storage, an IRB protocol that restricts transfer, a collaborator who shared a file on the understanding it would not leave your laptop. PondPilot is built for that reality — the analysis happens in your browser, and the data stays put.

## Honors Data-Use Agreements

Because PondPilot uses DuckDB-WASM, your dataset never hits a server. There is no upload step, no managed cloud, no vendor with custody of your file. That makes it straightforward to describe in an IRB application or to justify to a data steward reviewing how restricted data will be handled.

## Read the Formats Researchers Actually Get

CSV, TSV, Parquet, Excel, and JSON load directly. For SPSS (`.sav`), SAS (`.sas7bdat`), or Stata (`.dta`) exports, convert once with pyreadstat or R's `haven`, then work in Parquet — queries become dramatically faster and the file stays on disk.

## Reproducibility Through SQL Scripts

Point-and-click analyses are hard to replicate. A saved `.sql` script is a literal description of what you did: every filter, every join, every derived variable.

```sql
-- Adverse event rate by treatment arm, adults only
SELECT
  t.arm,
  COUNT(DISTINCT t.subject_id) AS n_subjects,
  SUM(CASE WHEN ae.severity IN ('moderate', 'severe') THEN 1 ELSE 0 END) AS ae_events,
  ROUND(
    100.0 * SUM(CASE WHEN ae.severity IN ('moderate', 'severe') THEN 1 ELSE 0 END)
    / COUNT(DISTINCT t.subject_id),
    2
  ) AS ae_per_100
FROM 'trial_subjects.parquet' t
LEFT JOIN 'adverse_events.parquet' ae USING (subject_id)
WHERE t.age >= 18
GROUP BY t.arm
ORDER BY ae_per_100 DESC;
```

Paste that into a supplementary materials file and any reviewer with the same data can reproduce the row.

## Survey Data Cleaning

Survey exports are messy — Likert items coded as strings, skip logic leaving nulls, free-text columns you want to exclude. SQL handles all of it without a 200-line script:

```sql
SELECT
  respondent_id,
  CASE q3
    WHEN 'Strongly disagree' THEN 1
    WHEN 'Disagree' THEN 2
    WHEN 'Neutral' THEN 3
    WHEN 'Agree' THEN 4
    WHEN 'Strongly agree' THEN 5
  END AS q3_score
FROM 'survey_wave2.csv'
WHERE consent_given = TRUE;
```

## Works Offline

Install PondPilot as a PWA and analyze sensitive data on a laptop that is air-gapped or simply on a plane. No connectivity, no problem.

## Free and Open Source

No license to expense, no grant line-item, no institutional site agreement. Graduate students and PIs use the same tool.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io) — private SQL for research data.

---

## Related

- [Data Tools for Journalists](/audience/data-tools-for-journalists/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Data Analysis Without Uploading](/privacy/data-analysis-without-uploading/)
