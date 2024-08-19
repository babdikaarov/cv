#!/usr/bin/env bash

docker run --rm -i -v "$PWD":/data babdikaarov/latex pdflatex beksultan_abdikaarov_resume.tex
