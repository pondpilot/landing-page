---
layout: page
title: "Survey Data Analysis — Cross-Tabs and Response Counts in SQL"
description: "Analyze survey CSV and SPSS exports locally with SQL. Quick response counts, cross-tabs, and filtering in your browser."
permalink: /use-cases/survey-data-analysis/
---


Survey exports come out of Qualtrics, SurveyMonkey, Google Forms, Typeform, and a dozen academic tools — usually as CSV, sometimes as SPSS `.sav`. PondPilot lets you query any of them with SQL, locally, without uploading respondent data to another vendor.

## Quick Response Counts

The first question after fielding a survey is always the same: how did people actually answer? SQL makes that fast:

```sql
SELECT
  q3_satisfaction,
  COUNT(*) as responses,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) as pct
FROM survey_responses.csv
WHERE completed = true
GROUP BY q3_satisfaction
ORDER BY q3_satisfaction;
```

Drop the file into [PondPilot](https://app.pondpilot.io), run the query, get your distribution in seconds.

## Cross-Tabs Without SPSS

A cross-tab is just a `GROUP BY` with a pivot. DuckDB has `PIVOT` built in:

```sql
PIVOT survey_responses.csv
ON region
USING COUNT(*)
GROUP BY q3_satisfaction
ORDER BY q3_satisfaction;
```

Satisfaction by region, with counts filled in. No macros, no syntax file, no point-and-click wizard.

## SPSS `.sav` Files

If your survey platform or collaborator hands you an SPSS `.sav` export, the DuckDB [read_stat](https://github.com/mettekou/duckdb-read-stat) community extension reads it directly — including variable labels and value labels. Useful when the raw numeric codes don't tell you which response option they map to.

Also handy for inheriting legacy academic datasets where the codebook lives inside the `.sav` itself.

## Filter, Segment, Compare

Once the data's loaded, the usual survey questions are one query away: completion rate by segment, drop-off by question, Net Promoter split, weighted averages, open-text filtering with `ILIKE`. No server, no API quota, no per-seat license.

## Privacy Matters for Surveys

Even "anonymous" surveys often carry enough demographic detail to re-identify small subgroups. Employee surveys, patient-experience surveys, and student surveys are particularly sensitive. Keeping the raw respondent file on your workstation — instead of uploading it to a third-party analytics tool — keeps that risk where you can control it.

## Export Clean Results

Once you've computed the cross-tab or summary you need, export the result as CSV to drop into a report or slide. The raw respondent file stays on your machine; only the aggregated output moves.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io) and drop in your survey export. Free, open source, no signup.

---

## Related

- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Explore JSON Data Locally](/use-cases/explore-json-data-locally/)
