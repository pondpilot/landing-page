# PondPilot Landing Page Justfile
# https://just.systems/

# List available commands
default:
    @just --list

# Serve the site locally with Jekyll (via Docker)
serve:
    @echo "Starting Jekyll server at http://localhost:4000..."
    @docker-compose up

# Serve the built site with simple HTTP server (from _site directory)
serve-simple:
    @echo "Starting simple HTTP server at http://localhost:8000..."
    @cd _site && python3 -m http.server || cd _site && python -m http.server

# Format HTML files
format-html:
    @echo "Formatting HTML files..."
    @npx prettier --write *.html

# Format CSS files
format-css:
    @echo "Formatting CSS files..."
    @npx prettier --write assets/**/*.css

# Validate HTML
validate-html:
    @echo "Validating HTML..."
    @npx html-validate index.html

# Create a new blog post (interactive)
new-post:
    #!/usr/bin/env bash
    set -e

    # Get post title
    echo -n "Enter post title: "
    read TITLE

    # Generate filename-friendly version of title
    FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--+/-/g' | sed 's/^-//g' | sed 's/-$//g')

    # Get today's date
    DATE=$(date +"%Y-%m-%d")

    # Get author name
    echo -n "Enter author name: "
    read AUTHOR

    # Ask if post should have an image
    echo -n "Include featured image? (y/n): "
    read WITH_IMAGE

    # Create post file
    FILE="_posts/$DATE-$FILENAME.md"

    echo "---" > "$FILE"
    echo "layout: post" >> "$FILE"
    echo "title: \"$TITLE\"" >> "$FILE"
    echo "date: $DATE" >> "$FILE"
    echo "author: \"$AUTHOR\"" >> "$FILE"

    if [[ "$WITH_IMAGE" == "y" ]]; then
        # Create default image path
        IMAGE_PATH="/blog/images/$FILENAME.png"
        echo "image: \"$IMAGE_PATH\"" >> "$FILE"
        echo "Creating placeholder for image at blog/images/$FILENAME.png"
        cp example.png "blog/images/$FILENAME.png"
    fi

    echo "---" >> "$FILE"
    echo "" >> "$FILE"
    echo "Write your post content here. This first paragraph will be used as the excerpt." >> "$FILE"
    echo "" >> "$FILE"
    echo "## Heading 2" >> "$FILE"
    echo "" >> "$FILE"

    if [[ "$WITH_IMAGE" == "y" ]]; then
        echo "![Alt text for image]($IMAGE_PATH)" >> "$FILE"
        echo "*Caption for the image*" >> "$FILE"
        echo "" >> "$FILE"
    fi

    echo "Created new post at $FILE"

    # Open the file in the default editor if EDITOR is set
    if [[ -n "$EDITOR" ]]; then
        $EDITOR "$FILE"
    else
        echo "Post created. Edit it with your favorite text editor."
    fi

# Build the site with Jekyll (via Docker)
build:
    @echo "Building site with Jekyll..."
    @docker run --rm -v $(pwd):/site bretfisher/jekyll-serve bundle exec jekyll build

# Clean the site build
clean:
    @echo "Cleaning site build..."
    @rm -rf _site

# Build and serve the site with simple HTTP server
build-and-serve: build serve-simple

# Full development setup (format, validate, serve)
dev: format-html format-css validate-html serve
