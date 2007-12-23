#
# Copyright (C) 2007 by Xu Yuan <xuyuan.cn@gmail.com>
# $Id$
#
# This file is part of the SEU-Thesis package project.
# ---------------------------------------------------
#
# This file may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3a
# of this license or (at your option) any later version.
# The latest version of this license is in:
# 
# http://www.latex-project.org/lppl.txt
# 
# and version 1.3a or later is part of all distributions of LaTeX 
# version 2004/10/01 or later.
#

PACKAGE=seuthesis
SRC=${PACKAGE}.ins ${PACKAGE}.dtx

MAIN=main
MAIN_SRC=${MAIN}.tex content/*.tex

all: package sample

main: main.pdf

package: ${PACKAGE}.pdf

sample: sample-gbk.pdf sample-utf8.pdf

clean:
	rm -f *.aux *.log *.toc *.ind *.inx *.gls *.glo *.ist *.idx *.ilg *.out *.bak *.bbl *.brf *.blg *.dvi *.ps sample-content-gbk.tex

distclean: clean
	rm -f *.cls *.cfg

${PACKAGE}.cls: ${SRC}
	rm -f ${PACKAGE}.cls ${PACKAGE}-gbk.cfg ${PACKAGE}-utf8.cfg
	latex ${PACKAGE}.ins
	iconv -f utf8 -t gbk ${PACKAGE}-utf8.cfg > ${PACKAGE}-gbk.cfg

${PACKAGE}.pdf: ${PACKAGE}.dtx ${PACKAGE}.bib
	pdflatex ${PACKAGE}.dtx
	bibtex ${PACKAGE}
	pdflatex ${PACKAGE}.dtx

sample-gbk.pdf: sample-gbk.tex sample-content-utf8.tex ${PACKAGE}.cls
	iconv -f utf8 -t gbk sample-content-utf8.tex > sample-content-gbk.tex
	pdflatex sample-gbk.tex
	gbk2uni sample-gbk
	pdflatex sample-gbk.tex

sample-utf8.pdf: sample-utf8.tex ${PACKAGE}.cls
	pdflatex sample-utf8.tex
	pdflatex sample-utf8.tex

main.pdf: ${MAIN_SRC} ${PACKAGE}.cls
	pdflatex main.tex
	pdflatex main.tex