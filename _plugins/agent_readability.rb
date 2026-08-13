# frozen_string_literal: true

# Builds the machine-readable surface of pondpilot.io from the same sources as
# the HTML pages, so the two cannot drift: a raw-markdown twin of every content
# page, the long-form /llms-full.txt bundle, and the /mcp agent index. Runs as a
# generator (before rendering), so page bodies are still unconverted markdown.
module PondPilot
  SITE_URL = "https://pondpilot.io"
  SEPARATOR = "-" * 40
  # Source paths, other than posts and pSEO pages, that get a markdown twin.
  EXTRA_TWIN_PAGES = ["pricing/index.md"].freeze
  # Permalink prefixes of the pSEO pages, in the order llms-full.txt lists them.
  PSEO_PREFIXES = %w(alternatives audience duckdb formats privacy tools use-cases).freeze

  # A generated page whose body must reach _site byte for byte: no Liquid, no
  # kramdown. The source name keeps a .txt extension (nothing converts .txt)
  # while the explicit permalink decides the published path and extension.
  class RawPage < Jekyll::PageWithoutAFile
    def initialize(site, url, body)
      dir = File.dirname(url)
      super(site, site.source, dir == "/" ? "" : dir, "#{File.basename(url, ".*")}.txt")
      self.content = body
      data["permalink"] = url
      data["sitemap"] = false
      data["layout"] = nil
      data["render_with_liquid"] = false
    end
  end

  class AgentReadability < Jekyll::Generator
    safe true

    def generate(site)
      posts = site.posts.docs.reverse # newest first
      pseo = pseo_pages(site)
      extra = site.pages.select { |p| EXTRA_TWIN_PAGES.include?(p.relative_path) }

      (posts + pseo + extra).each do |doc|
        url = twin_url(doc)
        doc.data["md_twin_url"] = url
        site.pages << RawPage.new(site, url, twin_body(doc))
      end

      site.pages << RawPage.new(site, "/llms-full.txt", llms_full_body(site, posts, pseo))
      site.pages << RawPage.new(site, "/mcp/index.html", mcp_body)
    end

    private

    # Grouped by permalink prefix, alphabetically within each group.
    def pseo_pages(site)
      pages = site.pages.select { |p| p.relative_path.start_with?("pseo/") }
      pages.sort_by { |p| [PSEO_PREFIXES.index(p.url.split("/")[1]) || PSEO_PREFIXES.size, p.url] }
    end

    def twin_url(doc)
      "#{doc.url.chomp("/")}.md"
    end

    def body_of(doc)
      doc.content.strip
    end

    def meta_lines(doc)
      lines = ["- Canonical: #{SITE_URL}#{doc.url}"]
      return lines unless doc.is_a?(Jekyll::Document)

      lines << "- Published: #{doc.date.strftime("%Y-%m-%d")}"
      author = doc.data["author"]
      lines << "- Author: #{author}" if author && !author.to_s.empty?
      lines
    end

    def twin_body(doc)
      parts = ["# #{doc.data["title"]}"]
      description = doc.data["description"]
      parts << "> #{description}" if description && !description.to_s.empty?
      parts << meta_lines(doc).join("\n")
      parts << "---"
      parts << body_of(doc)
      "#{parts.join("\n\n")}\n"
    end

    # llms-full.txt inlines the bodies, so site-relative links have to become
    # absolute to stay usable once the text is read outside the site.
    def absolutize(body)
      body.gsub("](/", "](#{SITE_URL}/").gsub('src="/', %(src="#{SITE_URL}/))
    end

    def llms_full_entry(doc)
      lines = ["# #{doc.data["title"]}", "Canonical: #{SITE_URL}#{doc.url}"]
      lines << "Published: #{doc.date.strftime("%Y-%m-%d")}" if doc.is_a?(Jekyll::Document)
      "#{SEPARATOR}\n\n#{lines.join("\n")}\n\n#{absolutize(body_of(doc))}\n"
    end

    def llms_full_body(site, posts, pseo)
      header = [
        "# #{site.config["name"]}",
        site.config["description"],
        "Short-form index of this site: #{SITE_URL}/llms.txt",
        "This file carries the full text of every blog post and every comparison, " \
        "format, audience, privacy, tooling, and use-case page on #{SITE_URL}, " \
        "in one document. Entries are separated by a line of dashes.",
      ].join("\n\n")

      entries = (posts + pseo).map { |doc| llms_full_entry(doc) }
      "#{header}\n\n#{entries.join("\n")}"
    end

    # Product facts below are copied verbatim from llms.txt — re-check both
    # against the live site whenever positioning or licensing changes.
    def mcp_body
      <<~MARKDOWN
        # PondPilot for AI agents

        PondPilot is a family of 100% client-side, DuckDB-powered, open-source data tools. You query, embed, and trace your data entirely in the browser — nothing is ever uploaded to a server. Built by Dark Lake, LLC.

        This page is a plain-text index of everything on #{SITE_URL} that is written for machines: where the structured product facts live, how to fetch any page as raw markdown, and what PondPilot is.

        ## Machine-readable resources

        - #{SITE_URL}/llms.txt — short-form product context: the three products, key pages, and a linked index of every blog post and comparison, format, audience, privacy, tooling, and use-case page.
        - #{SITE_URL}/llms-full.txt — long-form companion to llms.txt, carrying the full text of every one of those pages so answers can be grounded in primary source material.
        - #{SITE_URL}/pricing.md — pricing in structured markdown: per-product price, license, and how to run each tool.
        - #{SITE_URL}/sitemap.xml — every indexable page on the site.
        - #{SITE_URL}/robots.txt — crawl policy. Major AI crawlers are explicitly allowed.
        - Raw markdown for any content page: append `.md` to its URL. #{SITE_URL}/alternatives/db-fiddle-alternative/ becomes #{SITE_URL}/alternatives/db-fiddle-alternative.md — same content, no page chrome, with the canonical URL (and, for blog posts, the publication date and author) in a short metadata block at the top.

        ## About this URL

        This URL is a static markdown document, not an MCP protocol endpoint. There is no JSON-RPC transport, no tool listing, and no session to open here. Fetching it with an HTTP GET is the only supported interaction.

        PondPilot does not currently ship an MCP server — not on this domain, and not inside any of the three products. If that changes, this section will say where the server actually runs.

        ## Key facts

        - PondPilot is free and open source. There are no paid tiers, no per-seat pricing, no accounts, and no usage limits.
        - All three tools run on DuckDB compiled to WebAssembly, so processing happens on the user's own machine. The strongest, most repeatable guarantee across the whole family: your data never leaves your device.
        - PondPilot App — in-browser SQL editor powered by DuckDB-WASM. Query CSV, Parquet, JSON, XLSX, DuckDB, Stata (.dta), SAS (.sas7bdat/.xpt), and SPSS (.sav) files directly from your machine, read-only, with an AI SQL assistant, charts, and data comparison. Opens instantly, no signup; installable as an offline PWA or self-hostable via Docker. License: AGPL-3.0.
        - FlowScope — privacy-first SQL lineage engine that runs in the browser (Rust compiled to WebAssembly). Draws column-level lineage across tables, CTEs, and columns; multi-dialect (PostgreSQL, Snowflake, BigQuery, DuckDB, dbt); 72 lint rules with auto-fix; CLI for CI; "Librarian" AI chat over your lineage. License: Apache-2.0.
        - PondPilot Widget — embeddable, interactive SQL snippets powered by DuckDB-WASM. Turns static SQL code blocks in docs and blog posts into runnable, editable snippets in about 22KB, with zero backend. License: MIT.
        - Operator: Dark Lake, LLC.

        ## Links

        - Website: #{SITE_URL}
        - Pricing: #{SITE_URL}/pricing/
        - Blog: #{SITE_URL}/blog/
        - PondPilot App: https://app.pondpilot.io
        - FlowScope: https://flowscope.pondpilot.io
        - PondPilot Widget: https://widget.pondpilot.io
        - GitHub organization: https://github.com/pondpilot
      MARKDOWN
    end
  end
end
