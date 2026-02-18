---
layout: default
title: "Column-Level Lineage Tool — Trace SQL Data Flow Precisely"
description: "Map data flow at the column level in SQL queries. FlowScope provides precise lineage analysis — Rust+WASM, multi-dialect, open source."
permalink: /tools/column-level-lineage-tool/
---

# Column-Level Lineage Tool

Table-level lineage tells you "this query reads from table A and writes to table B." Column-level lineage tells you exactly which columns in B came from which columns in A, and how they were transformed. That precision matters.

## Why Column-Level Matters

**Impact analysis:** "If I drop `customer_email` from the source table, which downstream reports break?" Table-level lineage can't answer this. Column-level can.

**GDPR compliance:** Data privacy regulations require knowing exactly where PII flows. Column-level lineage maps the path of `email`, `phone`, and `address` through your SQL transformations.

**Metric debugging:** When a KPI looks wrong, trace the calculation back to its source columns. See every JOIN, filter, and aggregation along the way.

## FlowScope: Precise SQL Lineage

[FlowScope](https://pondpilot.io/flowscope/) is PondPilot's SQL lineage engine, built in Rust and compiled to WebAssembly:

- **Column-level granularity:** Maps individual column dependencies through CTEs, subqueries, JOINs, and UNIONs
- **Multi-dialect:** Supports multiple SQL dialects, not just one vendor's syntax
- **Client-side:** Runs in your browser — your SQL never leaves your machine
- **Open source:** Inspect, contribute, or integrate into your own tools

## How It Works

Paste a SQL statement into FlowScope. It parses the query, resolves aliases and CTEs, and produces a lineage graph showing how each output column traces back to source columns.

```sql
SELECT
  o.order_id,
  c.name as customer_name,
  SUM(oi.quantity * oi.unit_price) as total_value
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.name;
```

FlowScope maps: `total_value` ← `oi.quantity` + `oi.unit_price`. `customer_name` ← `c.name`. Precisely.

## Integrate with Your Pipeline

FlowScope's WASM build means you can embed it in CI/CD pipelines, documentation tools, or internal platforms. Analyze lineage programmatically without running a server.

## Try It

[Open FlowScope](https://pondpilot.io/flowscope/) and paste your SQL.

---

## Related

- [SQL Lineage Visualization](/tools/sql-lineage-visualization/)
- [Data Quality Check Tool](/tools/data-quality-check-tool/)
- [SQL Editor for Documentation](/use-cases/sql-editor-for-documentation/)
