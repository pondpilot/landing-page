---
layout: post
title: "PondPilot v0.2.0 Released: New Features and Improvements"
date: 2025-05-13
author: "Polly"
image: "/blog/images/v0.2.0.webp"
description: "PondPilot v0.2.0 brings major performance gains, multi-gigabyte file support, and new visualization features to the browser-based SQL explorer."
---

We're excited to announce the release of PondPilot v0.2.0! A quick reminder: PondPilot is continuously updated at [app.pondpilot.io](https://app.pondpilot.io), but we occasionally mark major milestones so you can easily discover new features and improvements. Let's dive into the highlights of this release.

## What's New in v0.2.0

PondPilot v0.2.0 introduces significant enhancements to help you analyze and visualize your data more effectively:

### Key Highlights

There have been many improvements since v0.1.0, including a complete rework of how we handle data sources, allowing us to open multi-gigabyte files in milliseconds. Here are some highlights:

1. **Improved Performance**: PondPilot is now nearly as fast as the native DuckDB CLI and can open multi-gigabyte files instantly, making your data exploration experience much smoother.

2. **Script Sharing**: You can now share your SQL scripts with others via a simple URL, making it easy to collaborate with your team or share your work with the community.

3. **Automatic Data Refresh**: If a local file source is changed outside of PondPilot, the app will now behave like a true desktop application and transparently pick up the changes. *Note: There are still some limitations with this feature, but we are working on it.*

4. **Folder Support**: You can now add entire folders to PondPilot, and it will automatically include all the files inside, streamlining your workflow for projects with multiple data files.

5. **Full Multi-Tab State Support**: The app now feels like a true IDE, with tabs remembering their state between reloads and when switching between them.

6. **Query Editor Improvements**: The query editor now provides better auto-completion suggestions, including automatic quoting. Finally, you can safely and easily work with your favorite file called `my 🦆.csv`!

## What's Next

We are already working on the next version. Here are some features you can expect:

- **Query Editor Improvements**: We know the current query editor is far from perfect; we are working on bringing a full VS Code experience to PondPilot.

- **Persistent Database**: Soon, PondPilot will persist the managed internal DuckDB database across reloads, so you'll be able to maintain not just scripts and sources, but also temporary tables and other DuckDB objects.

- **New Export Formats**: More export formats are coming, including JSON, Parquet, and DuckDB.

- **New Remote Data Sources**: Multiple new data sources are coming, including remote DuckDB databases.

## Feedback and Changelog

We're continuously working to improve PondPilot based on user feedback. If you have suggestions or encounter any issues, please share them with us through our [GitHub repository](https://github.com/pondpilot/pondpilot).

For a complete list of changes and improvements in this version, check out the [full changelog](https://github.com/pondpilot/pondpilot/releases/tag/v0.2.0).

## Get Started Today

Ready to try the latest version? [Launch PondPilot](https://app.pondpilot.io) in your browser and experience the enhanced data exploration capabilities of v0.2.0!
