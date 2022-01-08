SRCS=$(wildcard *.scala)

all: $(SRCS:.scala=.out) $(SRCS:.scala=.min.out)

%.out: %.scala
	-../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --vc-cache=false --solvers=smt-z3-opt --no-colors $< > $@
	
%.min.out: %.scala
	-../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --vc-cache=false --solvers=smt-z3-min --no-colors $< > $@

.PHONY: clean

clean:
	rm -rf *.out