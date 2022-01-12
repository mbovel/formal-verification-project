SCALA_EXAMPLES=$(wildcard examples/*.scala)
TIP_EXAMPLES=$(wildcard examples/*.tip)
SMT2_EXAMPLES=$(wildcard examples/*.smt2)

all: report.pdf $(SCALA_EXAMPLES:.scala=.out) $(SCALA_EXAMPLES:.scala=.min.out) $(TIP_EXAMPLES:.tip=.out) $(TIP_EXAMPLES:.tip=.min.out) $(SMT2_EXAMPLES:.smt2=.out)

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

%.out: %.scala
	-../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --vc-cache=false --solvers=smt-z3-opt --no-colors $< > $@
	
%.min.out: %.scala
	-../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --vc-cache=false --solvers=smt-z3-min --no-colors $< > $@
	
%.out: %.tip
	-../../inox/inox --solvers=smt-z3-opt $< > $@

%.out: %.smt2
	z3 $< > $@
	
%.min.out: %.tip
	-../../inox/inox --solvers=smt-z3-min $< > $@

.PHONY: clean

clean:
	rm -rf *.pdf *.tex examples/*.out
