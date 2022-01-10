all: report.pdf

%.pdf: %.tex
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` --entrypoint sh pandoc/latex -c \
		"pdflatex $< && bibtex ${<:.tex=} && pdflatex $< && pdflatex $<"
	rm -rf *.aux *.log *.bbl *.blg

%.tex: %.md
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex \
		$< \
		--standalone \
		--bibliography bib.bib \
		--natbib \
		--output $@ \
		--metadata date="`date "+%B %e, %Y"`"

.PHONY: clean

clean:
	rm -rf *.pdf *.tex
