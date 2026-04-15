---
layout: page
title: "SQL Tool for Marketers — Campaign CSVs and UTM Analysis in the Browser"
description: "Analyze campaign exports, channel attribution, and UTM performance without waiting on analytics. PondPilot runs SQL on your CSVs in the browser."
permalink: /audience/sql-tool-for-marketers/
---


You have a Google Ads export, a Meta CSV, a HubSpot contacts file, and a UTM-tagged session pull from GA. The analytics team is three weeks out. The campaign wraps Friday. PondPilot lets you stitch those CSVs together and answer your own questions today, in a browser tab.

## Campaign Exports, Joined

Every ad platform exports CSV. Drop them all into [app.pondpilot.io](https://app.pondpilot.io) and query them as if they were one database:

```sql
-- Blended CAC by channel across paid platforms
SELECT
  channel,
  SUM(spend) AS total_spend,
  SUM(conversions) AS total_conversions,
  ROUND(SUM(spend) / NULLIF(SUM(conversions), 0), 2) AS cac
FROM (
  SELECT 'google' AS channel, cost AS spend, conversions FROM 'google_ads.csv'
  UNION ALL
  SELECT 'meta',   amount_spent,        results       FROM 'meta_ads.csv'
  UNION ALL
  SELECT 'linkedin', total_spent,       leads         FROM 'linkedin_ads.csv'
)
GROUP BY channel
ORDER BY cac;
```

## UTM Attribution Without a Ticket

Pull a sessions export from GA or your product analytics and do the attribution cut you actually want:

```sql
SELECT
  utm_source,
  utm_medium,
  utm_campaign,
  COUNT(DISTINCT session_id) AS sessions,
  COUNT(DISTINCT CASE WHEN converted THEN user_id END) AS converters,
  ROUND(
    100.0 * COUNT(DISTINCT CASE WHEN converted THEN user_id END)
    / NULLIF(COUNT(DISTINCT user_id), 0),
    2
  ) AS conversion_rate
FROM 'sessions.csv'
WHERE session_start >= DATE '2024-10-01'
GROUP BY 1, 2, 3
ORDER BY sessions DESC;
```

## First-Touch vs. Last-Touch

Multi-touch attribution is a SQL window function away:

```sql
WITH ordered AS (
  SELECT
    user_id,
    utm_source,
    event_ts,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_ts) AS rn_first,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_ts DESC) AS rn_last
  FROM 'touchpoints.csv'
)
SELECT
  COUNT(*) FILTER (WHERE rn_first = 1 AND utm_source = 'google') AS first_touch_google,
  COUNT(*) FILTER (WHERE rn_last  = 1 AND utm_source = 'google') AS last_touch_google
FROM ordered;
```

## CRM Joins

Join your Meta lead export to a HubSpot contacts CSV and see which ad sets actually produced pipeline — not just form fills:

```sql
SELECT m.adset_name, COUNT(*) AS leads, SUM(CASE WHEN h.stage = 'SQL' THEN 1 ELSE 0 END) AS sqls
FROM 'meta_leads.csv' m
LEFT JOIN 'hubspot_contacts.csv' h ON m.email = h.email
GROUP BY m.adset_name
ORDER BY sqls DESC;
```

## No Upload, No Vendor Account

Paid-media exports include customer emails and PII. PondPilot processes them locally in the browser — nothing is uploaded, no marketing-SaaS vendor ends up holding a copy.

## SQL Basics Are Enough

GROUP BY is a pivot table. WHERE is a filter. JOIN is a VLOOKUP that actually works. The autocomplete shows you what's available as you type.

## Start Analyzing

[Open PondPilot](https://app.pondpilot.io) — marketing SQL, no ticket required.

---

## Related

- [SQL Tool for Product Managers](/audience/sql-tool-for-product-managers/)
- [Excel Alternative for Data Analysis](/alternatives/excel-alternative-for-data-analysis/)
- [Browser SQL Analytics](/use-cases/browser-sql-analytics/)
