---
layout: default
title: "Data Tools for Journalists — Investigate Data Privately"
description: "Analyze datasets for investigations without uploading to cloud services. PondPilot runs SQL in your browser — source protection built in."
permalink: /audience/data-tools-for-journalists/
---

# Data Tools for Journalists

Investigative journalism runs on data. Public records, leaked documents, FOI responses — they all need analysis. But uploading sensitive datasets to cloud tools puts sources at risk. PondPilot keeps your analysis local.

## Source Protection Starts with Your Tools

When you upload data to a cloud analytics tool, you're trusting that vendor with potentially sensitive information. PondPilot processes data entirely in your browser using DuckDB WebAssembly. No server receives your files, no cloud stores your queries.

For journalists working with whistleblower data or leaked documents, this architecture is meaningful protection.

## SQL for Data Journalism

SQL is the lingua franca of data analysis. PondPilot lets you query CSV files (the format most government data comes in) with full SQL:

```sql
-- Campaign finance: top donors by total contributions
SELECT donor_name, SUM(amount) as total, COUNT(*) as num_donations
FROM contributions.csv
GROUP BY donor_name
ORDER BY total DESC
LIMIT 20;
```

```sql
-- Find records appearing in two different datasets
SELECT a.* FROM dataset_a.csv a
JOIN dataset_b.csv b ON a.entity_id = b.entity_id;
```

## Handle Large Public Datasets

Government data releases often contain hundreds of thousands of rows. Excel struggles; PondPilot doesn't. DuckDB is an analytical database engine — it's built for this.

## No Account, No Paper Trail

PondPilot requires no account, no email, no login. There's no usage log, no query history on a server, no trail connecting you to a dataset. Open the app, do your analysis, close the tab.

## Works Offline

Working on a story you don't want touching the internet? Install PondPilot as a PWA and analyze data completely offline.

## Interactive Embeds for Published Stories

Use [PondPilot Widget](https://widget.pondpilot.io) to embed interactive SQL in your published data journalism. Let readers explore the data behind your findings.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io) — free, private, open source.

---

## Related

- [Data Analysis for Startups](/audience/data-analysis-for-startups/)
- [Private Data Exploration](/privacy/private-data-exploration/)
- [Data Analysis Without Uploading](/privacy/data-analysis-without-uploading/)
