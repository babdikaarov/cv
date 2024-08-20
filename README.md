# CV Maker using LaTeX

## Sample

![cv](./beksultan_abdikaarov_resume.jpg)

This repository contains a simple and efficient CV generator built using LaTeX. The primary purpose of this project is to enable users to create professional and aesthetically pleasing CVs with minimal effort.

## Features

-  **Customizable Templates**: Easily modify the LaTeX templates to suit your style and preferences.
-  **Automatic Formatting**: Ensures that your CV is neatly formatted and well-organized.
-  **PDF Output**: Generates high-quality PDF documents suitable for printing and digital sharing.

## Prerequisites

To use this CV maker, you'll need to have the following installed on your system:

-  Docker (for containerized builds)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/babdikaarov/cv.git
cd cv
```

### Build the Docker Image

```bash
docker build -t cv-maker-latex .
```

### Generate Your CV

Place your LaTeX files in the `/data` directory. Then, run the following command:

```bash

if ls *.tex 1> /dev/null 2>&1; then
  docker run --rm -i -v "$PWD":/data cv-maker-latex /bin/bash -c \
    'for file in *.tex; do \
      base=$(basename "$file" .tex); \
      pdflatex "$file"; \
      convert -density 300 "$base.pdf" -quality 100 "$base.jpg"; \
    done'
else
  echo "No .tex files found in the current directory."
fi

```

This command will generate a PDF version of your CV in the `/data` directory.

## License

This project is licensed under the MIT License. However, the latex template is owned by Sourabh Bajaj.

use this github action yml for excluding image generation

```yml
name: Docker Image CI

on:
   push:
      branches: [main]
   pull_request:
      branches: [main]

jobs:
   compile:
      name: Compile resume pdf
      runs-on: ubuntu-latest
      steps:
         - name: Check out the repo
           uses: actions/checkout@v4
         - name: Run the build process with Docker
           uses: addnab/docker-run-action@v3
           with:
              image: thomasweise/docker-texlive-full:latest
              options: -v ${{ github.workspace }}:/data
              run: |
                 cd data
                 pdflatex beksultan_abdikaarov_resume.tex
         - uses: stefanzweifel/git-auto-commit-action@v5
           with:
              commit_message: Apply pdflatex changes
```
