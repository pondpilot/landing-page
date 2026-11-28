---
layout: page
title: "Free SAS Viewer: Open .sas7bdat, No Download"
h1: "Free SAS file viewer: open .sas7bdat files online"
description: "Free online SAS viewer with nothing to download. Open a .sas7bdat or .xpt file in your browser, query it with SQL and export it to CSV, Excel or Parquet."
permalink: /formats/sas-file-viewer-free/
---


PondPilot is a free SAS file viewer that runs in your browser, so there is nothing to download or install. Open [app.pondpilot.io](https://app.pondpilot.io), add a `.sas7bdat` or `.xpt` file, and you can browse the rows, query them with SQL and export the result. You don't need a SAS license, and the file stays on your computer.

## Open Any .sas7bdat File

PondPilot reads SAS files using [duckdb-read-stat](https://github.com/pondpilot/duckdb-read-stat), a DuckDB extension that parses statistical data formats in WebAssembly. It handles the `.sas7bdat` format natively — variable names, labels, formats, and data types are all preserved.

Just go to [app.pondpilot.io](https://app.pondpilot.io) and open your file.

## If you were looking for SAS Universal Viewer

SAS Universal Viewer is SAS's own free viewer, and it is a Windows program that you download and install. PondPilot is a separate open-source tool that opens the same `.sas7bdat` files in a browser tab. That helps when you work on macOS or Linux, or when you can't install software on your machine.

## More Than a Viewer

Most free SAS viewers just show you rows and columns. PondPilot gives you a full SQL engine:

- Browse the schema and data types
- Preview any number of rows
- Write SQL queries against the data
- Join multiple files together
- Export results to CSV, Excel (.xlsx) or Parquet

It's the viewer that SAS power users wish they had for quick exploration.

## No License, No Catch

PondPilot is open source. There's no freemium upsell, no row limits, no watermarks on exports. The SAS file parsing happens entirely in your browser via WebAssembly. The PondPilot team maintains the duckdb-read-stat extension specifically to support these legacy statistical formats.

## Who Uses This?

- **Researchers** receiving datasets from collaborators who use SAS
- **Data engineers** migrating legacy SAS data to modern formats
- **Compliance teams** auditing SAS datasets without a SAS license
- **Students** working with publicly available research data in SAS format
- **Anyone** who just needs to peek at what's inside a `.sas7bdat` file

## Data Privacy

SAS files in healthcare, pharma, and government often contain sensitive data. PondPilot processes everything locally — no server, no cloud, no telemetry. Your file stays on your machine.

## FAQ

**Do I need to download anything to view a SAS file?**
No. PondPilot runs in a browser tab at app.pondpilot.io, so there is no installer. If you want it available offline, you can install it from the browser as a Progressive Web App.

**Is PondPilot the same as SAS Universal Viewer?**
No. SAS Universal Viewer is a free Windows application from SAS. PondPilot is an independent open-source tool that opens SAS files in the browser on Windows, macOS and Linux.

**Which SAS files can PondPilot open?**
PondPilot opens .sas7bdat datasets and .xpt transport files.

**Is my SAS file uploaded anywhere?**
No. DuckDB-WASM reads and processes the file in your browser, on your own device, and the App never uploads it.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) — it's free and works right now.

---

## Related

- [Open SAS Files in Browser](/formats/open-sas-files-in-browser/)
- [SAS to CSV Converter](/formats/sas-to-csv-converter/)
- [Open SPSS Files in Browser](/formats/open-spss-files-in-browser/)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Do I need to download anything to view a SAS file?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. PondPilot runs in a browser tab at app.pondpilot.io, so there is no installer. If you want it available offline, you can install it from the browser as a Progressive Web App."
      }
    },
    {
      "@type": "Question",
      "name": "Is PondPilot the same as SAS Universal Viewer?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. SAS Universal Viewer is a free Windows application from SAS. PondPilot is an independent open-source tool that opens SAS files in the browser on Windows, macOS and Linux."
      }
    },
    {
      "@type": "Question",
      "name": "Which SAS files can PondPilot open?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "PondPilot opens .sas7bdat datasets and .xpt transport files."
      }
    },
    {
      "@type": "Question",
      "name": "Is my SAS file uploaded anywhere?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No. DuckDB-WASM reads and processes the file in your browser, on your own device, and the App never uploads it."
      }
    }
  ]
}
</script>
