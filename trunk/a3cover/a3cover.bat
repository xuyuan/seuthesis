pdflatex -interaction=nonstopmode bookspine_hor.tex
pdflatex -interaction=nonstopmode bookspine_ver.tex
pdfcrop --margins 2 --clip bookspine_ver.pdf bookspine_res.pdf
pdflatex -interaction=nonstopmode A3cover.tex

rm *.aux *.log

rm bookspine_hor.pdf
rm bookspine_ver.pdf
