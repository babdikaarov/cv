# CV Maker using LaTeX ![visitors](https://vbr.nathanchung.dev/badge?page_id=babdikaarov.cv&color=00cf00)
 
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

### 1. Clone the Repository

```bash
git clone https://github.com/babdikaarov/cv.git
cd cv
rm beksultan_abdikaarov_resume.jpg beksultan_abdikaarov_resume.pdf
# rename file .tex
mv beksultan_abdikaarov_resume.tex your_name_resume.tex
```

### 2. Build the Docker Image

```bash
# it will take time
docker build -t babdikaarov/latex .
```

### 3. Change the content .tex file

### 4. Generate Your CV


```bash

if ls *.tex 1> /dev/null 2>&1; then
  docker run --rm -i -v "$PWD":/data babdikaarov/latex /bin/bash -c \
    'for file in *.tex; do \
      base=$(basename "$file" .tex); \
      pdflatex "$file"; \
      convert -density 300 "$base.pdf" -quality 100 "$base.jpg"; \
    done'
else
  echo "No .tex files found in the current directory."
fi

```
This command will generate a PDF version of your CV.

### (optional) Git hub actions

choose the triger strategy to use auto generation on github

```yml
on:
   workflow_dispatch:
   # push:
   #    branches: [main]
   # pull_request:
   #    branches: [main]
```


## License

This project is licensed under the MIT License.

