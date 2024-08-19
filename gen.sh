#!/usr/bin/env bash

# Check if a .tex file exists
if ls *.tex 1> /dev/null 2>&1; then
  # Run the Docker container to process all .tex files
  docker run --rm -i -v "$PWD":/data beksultan/latex /bin/bash -c \
    'for file in *.tex; do \
      base=$(basename "$file" .tex); \
      pdflatex "$file"; \
      convert -density 300 "$base.pdf" -quality 100 "$base.jpg"; \
    done'
else
  echo "No .tex files found in the current directory."
fi