# PondPilot Landing Page

This repository contains the landing page for PondPilot, a data exploration tool powered by DuckDB.

## Blog System

The landing page includes a simple blog system powered by Jekyll (automatically supported by GitHub Pages):

### Directory Structure

```
landing-page/
├── _config.yml         # Jekyll configuration
├── _layouts/           # Templates for Jekyll
│   ├── default.html    # Main layout template
│   └── post.html       # Blog post template
├── _posts/             # Blog posts in Markdown format
│   ├── YYYY-MM-DD-title-of-post.md  # Format for post filenames
├── blog/
│   ├── index.html      # Blog index page
│   ├── blog.css        # Blog-specific styles
│   └── images/         # Images for blog posts
```

### Creating a New Blog Post

1. Create a new Markdown file in the `_posts` directory with the filename format: `YYYY-MM-DD-title-of-post.md`
2. Include the following front matter at the top of the file:

```yaml
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD
author: "Your Name"
image: "/blog/images/your-image.png"  # Optional
---
```

3. Write your post content in Markdown format below the front matter
4. Add any images to `/blog/images/` directory and reference them in your post using the path `/blog/images/your-image.png`

### Running Locally

The simplest way to run the site locally is using the justfile commands:

```bash
# Install just if you don't have it
brew install just    # macOS with Homebrew
# or
cargo install just   # If you have Rust installed

# Start the Jekyll server with Docker
just serve

# Create a new blog post interactively
just new-post

# Run formatter, validator, and server
just dev
```

Visit `http://localhost:4000` in your browser.

Run `just` without arguments to see all available commands.

#### Alternative: Direct Docker Commands

```bash
# Start the Jekyll server with Docker (works on all Mac architectures)
./run-jekyll.sh
# Or simply
docker-compose up
```

This uses the `bretfisher/jekyll-serve` image which works on all architectures (Intel and Apple Silicon).

#### Alternative: Simple HTTP Server 

For quick testing without Jekyll (note: blog functionality won't work):

```bash
npx serve
# or
python -m http.server
```

## Deployment

This site is automatically deployed to GitHub Pages when changes are pushed to the main branch.