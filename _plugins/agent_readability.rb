# frozen_string_literal: true

# Builds the machine-readable surface of pondpilot.io from the same sources as
# the HTML pages, so the two cannot drift: a raw-markdown twin of every content
# page, the long-form /llms-full.txt bundle, and the /mcp agent index. Runs as a
# generator (before rendering), so page bodies are still unconverted markdown.
module PondPilot
  SEPARATOR = "-" * 40
  # Source paths, other than posts and pSEO pages, that get a markdown twin.
  EXTRA_TWIN_PAGES = ["pricing/index.md"].freeze
  # The pSEO sections, in display order: permalink prefix => heading. This is
  # the single source for the llms.txt index (via site.data.agent_sections),
  # llms-full.txt and the twins, so the files cannot disagree with each other.
  SECTIONS = [
    ["alternatives", "Alternatives"],
    ["audience", "Audience"],
    ["duckdb", "DuckDB"],
    ["formats", "Formats"],
    ["privacy", "Privacy"],
    ["tools", "Tools"],
    ["use-cases", "Use cases"],
  ].freeze

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
      @site_url = site.config["url"]
      posts = site.posts.docs.reverse # newest first
      pseo = pseo_pages(site)
      site.data["agent_sections"] = SECTIONS.map do |prefix, label|
        docs = pseo.select { |p| p.url.start_with?("/#{prefix}/") }
        {
          "label" => label,
          "pages" => docs.map { |p| { "title" => p.data["title"], "url" => p.url, "description" => p.data["description"] } },
        }
      end
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

    # SECTIONS order, title-sorted within each section — the same order the
    # llms.txt index renders. A page whose prefix is missing from SECTIONS
    # still gets a twin and an llms-full.txt entry, but drops out of the
    # llms.txt index, so warn loudly instead of hiding it.
    def pseo_pages(site)
      pages = site.pages.select { |p| p.relative_path.start_with?("pseo/") }
      ordered = SECTIONS.flat_map do |prefix, _label|
        pages.select { |p| p.url.start_with?("/#{prefix}/") }.sort_by { |p| p.data["title"].to_s }
      end
      rest = pages - ordered
      unless rest.empty?
        Jekyll.logger.warn "agent_readability:", "no SECTIONS entry covers: #{rest.map(&:url).join(", ")} — add the prefix so they appear in llms.txt"
      end
      ordered + rest.sort_by(&:url)
    end

    def twin_url(doc)
      "#{doc.url.chomp("/")}.md"
    end

    def body_of(doc)
      doc.content.strip
    end

    def meta_lines(doc)
      lines = ["- Canonical: #{@site_url}#{doc.url}"]
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
      body.gsub("](/", "](#{@site_url}/").gsub('src="/', %(src="#{@site_url}/))
    end

    def llms_full_entry(doc)
      lines = ["# #{doc.data["title"]}", "Canonical: #{@site_url}#{doc.url}"]
      lines << "Published: #{doc.date.strftime("%Y-%m-%d")}" if doc.is_a?(Jekyll::Document)
      "#{SEPARATOR}\n\n#{lines.join("\n")}\n\n#{absolutize(body_of(doc))}\n"
    end

    def llms_full_body(site, posts, pseo)
      header = [
        "# #{site.config["name"]}",
        site.config["description"],
        "Short-form index of this site: #{@site_url}/llms.txt",
        "This file carries the full text of every blog post and every comparison, " \
        "format, audience, privacy, tooling, and use-case page on #{@site_url}, " \
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

        This page is a plain-text index of everything on #{@site_url} that is written for machines: where the structured product facts live, how to fetch any page as raw markdown, and what PondPilot is.

        ## Machine-readable resources

        - #{@site_url}/llms.txt — short-form product context: the three products, key pages, and a linked index of every blog post and comparison, format, audience, privacy, tooling, and use-case page.
        - #{@site_url}/llms-full.txt — long-form companion to llms.txt, carrying the full text of every one of those pages so answers can be grounded in primary source material.
        - #{@site_url}/pricing.md — pricing in structured markdown: per-product price, license, and how to run each tool.
        - #{@site_url}/sitemap.xml — every indexable page on the site.
        - #{@site_url}/robots.txt — crawl policy. Major AI crawlers are explicitly allowed.
        - Raw markdown twins: every blog post, every page under /alternatives/, /audience/, /duckdb/, /formats/, /privacy/, /tools/ and /use-cases/, and the pricing page also exist as raw markdown — append `.md` to the page URL. #{@site_url}/alternatives/db-fiddle-alternative/ becomes #{@site_url}/alternatives/db-fiddle-alternative.md — same content, no page chrome, with the canonical URL (and, for blog posts, the publication date and author) in a short metadata block at the top.

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

        - Website: #{@site_url}
        - Pricing: #{@site_url}/pricing/
        - Blog: #{@site_url}/blog/
        - PondPilot App: https://app.pondpilot.io
        - FlowScope: https://flowscope.pondpilot.io
        - PondPilot Widget: https://widget.pondpilot.io
        - GitHub organization: https://github.com/pondpilot
      MARKDOWN
    end
  end
end
