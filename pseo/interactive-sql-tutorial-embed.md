---
layout: page
title: "Interactive SQL Tutorial Embed — Runnable Examples"
description: "Embed interactive SQL tutorials in your website. Readers edit and run queries in-browser. No server needed."
permalink: /use-cases/interactive-sql-tutorial-embed/
---


Teaching SQL with static code blocks is like teaching driving with a textbook. PondPilot Widget lets you embed interactive, runnable SQL examples that students can modify and experiment with.

## Runnable SQL in Any Webpage

[PondPilot Widget](https://widget.pondpilot.io) embeds a full SQL editor into your page. Students see a pre-filled query, hit Run, see results, then tweak the query and run again. The learning loop is immediate.

## No Backend, No Hosting Costs

Every query runs in the student's browser via DuckDB WebAssembly. You don't need a database server, a Docker container, or a cloud function. Embed the widget in a static HTML page and you're done.

This means your tutorial scales to thousands of concurrent readers without you paying a cent in compute.

## Build a SQL Course

Structure your tutorial with progressive exercises:

**Lesson 1 — SELECT basics:** Pre-fill a simple `SELECT * FROM table` query with sample data. Let students modify columns and add `WHERE` clauses.

**Lesson 2 — Aggregation:** Provide a dataset and ask students to write `GROUP BY` queries. They can validate their answers by running them.

**Lesson 3 — Joins:** Load two related tables and guide students through `INNER JOIN`, `LEFT JOIN`, and subqueries.

Each widget instance is independent — students can work through lessons at their own pace.

## Pre-Load Sample Data

PondPilot Widget supports loading data inline or from URLs. Seed each exercise with the right dataset so students start with context, not a blank slate.

## Used by Educators and Technical Writers

Whether you're building a data bootcamp, writing internal training docs, or creating a SQL reference for your open-source project, PondPilot Widget fits anywhere HTML loads.

## Get Started

Visit [widget.pondpilot.io](https://widget.pondpilot.io) for embed code and examples. It's open source and free.

---

## Related

- [Interactive SQL Blog Widget](/tools/interactive-sql-blog-widget/)
- [Embed SQL in Documentation](/tools/embed-sql-in-documentation/)
- [SQL Explorer for Students](/audience/sql-explorer-for-students/)
