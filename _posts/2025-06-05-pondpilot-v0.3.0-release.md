---
layout: post
title: "PondPilot v0.3.0: AI-Powered SQL and Persistent Databases"
date: 2025-06-05
author: "Polly"
image: "/blog/images/v0.3.0.webp"
description: "PondPilot v0.3.0 adds an AI-powered SQL assistant and persistent databases. Write, fix, and optimize queries with natural language."
---

We're absolutely thrilled to announce [PondPilot](https://app.pondpilot.io) v0.3.0! This release brings two of the most requested features from our community, along with a bunch of other improvements that make PondPilot even more powerful for your data exploration needs.

## The Big News: AI Assistant is Here! 🤖

Say hello to your new SQL companion! PondPilot now includes an AI Assistant that can write, fix, and optimize SQL queries for you. Whether you're stuck on a complex join or just want to quickly explore your data, the AI Assistant has your back.

Here's how it works:
- Just describe what you want to do with your data in plain English
- The AI Assistant will generate the SQL query for you
- It can also help debug and improve existing queries
- Works with OpenAI, Anthropic, or any LLM provider that supports the OpenAI API

Simply add your API key in the settings, and you're ready to go! No more staring at blank query editors wondering how to start.

## Persistent Database: Your Work Stays Put 💾

Remember those temporary tables and views that disappeared every time you refreshed the page? Not anymore! PondPilot now maintains a persistent writable database in browser cache that survives page reloads.

This means you can:
- Create temporary tables that actually stick around
- Build complex views and reference them later
- Maintain your data pipeline across sessions
- Work on longer-term projects without losing progress

It's like having a proper database workspace right in your browser!

## More Ways to Get Your Data Out

We've massively expanded export capabilities. You can now export your query results in:
- CSV (now, with advanced options)
- TSV (Tab-Separated Values)
- Markdown tables
- SQL INSERT statements
- Excel files (.xlsx)
- XML format

## Schema Browser: Know Your Data

The new Schema Browser gives you a complete overview of all your tables, columns, data types and even foreign key connections. You can:
- Browse all tables and views or a subset
- See column names and types at a glance
- Explore relationships between tables (if foreign keys are defined)
- Get a better understanding of your data structure

## Drag, Drop, Done

File loading just got easier! You can now drag and drop files directly into PondPilot. No more clicking through file dialogs – just grab your any of the supported file types and drop it right onto the interface. You can even drop entire folders, and PondPilot will automatically include all files inside.

## Under the Hood Improvements

We've also upgraded DuckDB, which unlocks some exciting new capabilities:
- **Remote DuckDB Support**: You can now attach remote DuckDB databases using the new httpfs support
- **Better CSV Handling**: Improved support for CSVs with large data fields and better error messages
- **Enhanced Autocomplete**: Function tooltips and autocomplete now use DuckDB's built-in documentation
- **Batch Operations**: Close multiple tabs at once using the spotlight command

## What's Coming Next

We're not slowing down! Already in development for the next release:
- **Unified Data Source Explorer**: A completely redesigned way to browse and manage all your data sources
- **AI Assistant Improvements**: @-mentions and even more automatic context-aware suggestions
- **New Data Source Types**: Support for more remote data sources and formats

## Get Started Today

Ready to experience AI-powered SQL and persistent databases? Head over to [app.pondpilot.io](https://app.pondpilot.io) and try out all these new features!

As always, we love hearing from our users. If you have feedback, suggestions, or run into any issues, please let us know through our [GitHub repository](https://github.com/pondpilot/pondpilot/issues).

Happy querying! 🦆
