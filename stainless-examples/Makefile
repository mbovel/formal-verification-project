SRCS=$(wildcard *.scala)

all: $(SRCS:.scala=.out)

%.out: %.scala
	../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --solvers=smt-z3 --no-colors $< > $@

.PHONY: clean

clean:
	rm -rf *.out