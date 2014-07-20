#!/bin/sh
pandoc -t beamer slides.rst -o slides.tex --filter ./pygments.hs -H solarized-defs.tex --template beamer_template.tex
sed s/begin{frame}/begin{frame}[fragile]/ slides.tex > slides-fragile.tex
pdflatex slides-fragile.tex
