SCALA_EXAMPLES=$(wildcard examples/*.scala)
TIP_EXAMPLES=$(wildcard examples/*.tip)
SMT2_EXAMPLES=$(wildcard examples/*.smt2)

SCALAC=../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac
INOX=../../inox/inox


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
	-${SCALAC} --vc-cache=false --solvers=smt-z3-opt --no-colors $< > $@

%.min.out: %.scala
	-${SCALAC} --vc-cache=false --solvers=smt-z3-min --no-colors $< > $@

benchmarks/%.csv: examples/%.scala
	benchmarks/bench.py smt-z3-opt -${SCALAC} --vc-cache=false --solvers=smt-z3-opt --no-colors $< > $@

benchmarks/%.min.csv: examples/%.scala
	benchmarks/bench.py smt-z3-min -${SCALAC} --vc-cache=false --solvers=smt-z3-min --no-colors $< > $@
	
%.out: %.tip
	-${INOX} --solvers=smt-z3-opt --no-colors=true $< > $@
	
%.min.out: %.tip
	-${INOX} --solvers=smt-z3-min --no-colors=true $< > $@

%.out: %.smt2
	z3 $< > $@

.PHONY: clean

clean:
	rm -rf *.pdf *.tex examples/*.out
