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

#SAMPLE=main
#SAMPLE_SRC=${SAMPLE}.tex content/*.tex
SAMPLE=sample
SAMPLE_SRC=${SAMPLE}.tex

.PYTHON: all cls pdf dvi ps clean

all: pdf

cls: ${PACKAGE}.cls

pdf: ${SAMPLE}.pdf ${PACKAGE}.pdf

dvi: ${PACKAGE}.dvi ${SAMPLE}.dvi

ps: ${PACKAGE}.ps ${SAMPLE}.pdf

clean:
	rm -f *.aux *.log *.toc *.ind *.inx *.gls *.glo *.ist *.idx *.ilg *.out *.bak

${PACKAGE}.cls: ${SRC}
	rm -f ${PACKAGE}.cls ${PACKAGE}.cfg
	latex ${PACKAGE}.ins

${PACKAGE}.dvi: ${PACKAGE}.cls ${PACKAGE}.dtx
	latex ${PACKAGE}.dtx
	bibtex ${PACKAGE}
	makeindex -s gind.ist -o ${PACKAGE}.ind ${PACKAGE}.idx
	makeindex -s gglo.ist -o ${PACKAGE}.gls ${PACKAGE}.glo
	latex ${PACKAGE}.dtx

${PACKAGE}.pdf: ${PACKAGE}.cls ${PACKAGE}.dtx
#	ps2pdf  ${PACKAGE}.ps
	pdflatex ${PACKAGE}.dtx
	gbk2uni ${PACKAGE}
	pdflatex ${PACKAGE}.dtx

${PACKAGE}.ps: ${PACKAGE}.dvi
#	gbk2uni ${PACKAGE}
	latex ${PACKAGE}.dtx
	dvips -Ppdf -G0 ${PACKAGE}.dvi

${SAMPLE}.dvi: ${SAMPLE_SRC}
	latex ${SAMPLE}


${SAMPLE}.pdf: ${SAMPLE_SRC} ${PACKAGE}.cls ${PACKAGE}.cfg
	pdflatex ${SAMPLE}
	gbk2uni ${SAMPLE}
	pdflatex ${SAMPLE}
#	dvipdfm ${SAMPLE}