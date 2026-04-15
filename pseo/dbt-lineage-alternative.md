---
layout: page
title: "dbt Lineage Alternative — SQL Lineage Without the Pipeline"
description: "Want dbt-style lineage without adopting dbt? FlowScope parses raw SQL and produces column-level lineage diagrams in the browser. No models, no project."
permalink: /alternatives/dbt-lineage-alternative/
---


One of the best things dbt gives you is a lineage graph — a picture of how models, columns, and sources depend on each other. But that graph only exists if you've already adopted dbt: project structure, `ref()` calls, a manifest, a runner. If you just want the lineage view for SQL you already have, FlowScope gets you there without the pipeline.

## Complement, Not Replacement

FlowScope isn't a transformation framework. It won't schedule your models, materialize tables, or manage environments — dbt does all of that, and does it well. What FlowScope does is the lineage part, directly from SQL text, for any SQL you can paste in.

Think of it as "dbt's lineage without the dbt project."

## What FlowScope Does

Paste a SQL query — a single `SELECT`, a stack of CTEs, a whole transformation script — and FlowScope:

- Parses the SQL
- Resolves CTEs, aliases, subqueries, joins, and unions
- Produces a column-level lineage diagram showing which source columns feed each output column

No `dbt_project.yml`. No `ref()` rewrites. No compiled manifest. Just SQL in, diagram out.

```sql
WITH customer_orders AS (
  SELECT user_id AS customer_id,
         COUNT(*) AS num_orders,
         SUM(amount) AS total_spent
  FROM warehouse.core.orders
  GROUP BY user_id
)
SELECT * FROM customer_orders;
```

FlowScope traces `total_spent` back to `orders.amount`, `num_orders` back to the row count, and `customer_id` back to `orders.user_id`.

## When This Beats Setting Up dbt

**Ad-hoc analysis.** You have one complicated query to debug, not a project to build. Spinning up dbt to visualize it is overkill.

**Existing non-dbt SQL.** Legacy pipelines, stored procedures, ETL tools that emit SQL — none of which are dbt models. FlowScope reads the SQL directly.

**Code review.** Reviewing a PR that changes SQL? Paste the before and after into FlowScope and see the lineage diff without compiling a project.

**Documentation.** Generate a lineage diagram for a query and drop it into the doc. No manifest to keep in sync.

## When dbt's Built-In Lineage Is Better

If you're already running dbt, its docs site gives you lineage across your entire project — including dependencies between models, tests, and sources. FlowScope operates on one query at a time. For whole-project lineage, stay in dbt docs.

## How FlowScope Runs

Client-side, in your browser. Your SQL never leaves the machine — useful for queries that touch internal table names you'd rather not paste into a SaaS tool. Open source, multi-dialect, supports CTEs, subqueries, joins, and unions.

## Try It

Open [FlowScope](https://flowscope.pondpilot.io) and paste a query. Lineage appears instantly.

---

## Related

- [SQL Lineage Visualization](/tools/sql-lineage-visualization/)
- [Column-Level Lineage Tool](/tools/column-level-lineage-tool/)
- [SQL Editor for Documentation](/use-cases/sql-editor-for-documentation/)
