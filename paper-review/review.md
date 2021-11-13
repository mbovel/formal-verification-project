---
documentclass: article
papersize: a4
fontsize: 11pt
title: |
    Review: On SAT modulo theories \
    and optimization problems [@paper]
subtitle: |
    CS550 Formal Verification, Background Paper Report
author:
- Matthieu Bovel (matthieu.bovel@epfl.ch)
- Solal Pirelli (solal.pirelli@epfl.ch)
header-includes: |
    \usepackage{amsfonts}
bibliography: bib.bib
biblio-style: plain
---

# Section 1

$\frac{a}{b} + \frac{c}{d}$

Test citation [@paper].

Some unicode: éà.

# Benchmarks

The authors use two kinds of benchmarks: existing benchmark suites for Max-SAT and the radio frequency assignment example for Max-SMT.

## Choice of benchmarks

There are three existing benchmark suites: "DIMACS", "Weighted DIMACS", and "Quasi-groups".
While the paper does not provide sources, the first appears to be a subset of the benchmarks available on https://www.cs.ubc.ca/~hoos/SATLIB/benchm.html.
The second seems to be a variation of the first with weights randomly varying from 1 to 1000 instead of being set at 1.
The final one was given to the authors in private correspondence by Felip Manyà.

The radio frequency assignment example consists of the 5 "sub-CELAR" examples from Table 3 of [@celar].

## Choice of baselines

As baselines, the authors compare against Toolbar [@toolbar], Pueblo [@pueblo], and MiniSat+ [@minisatplus].
These represent three different kinds of solvers: Toolbar solves weighted constraint satisfaction problems (and includes specializations for Max-SAT),
Pueblo solves pseudo-Boolean problems, and MiniSat+ translates pseudo-Boolean problems into SAT.
The authors note that these tools are all designed for a broader class of problems than their own DPLL(T).

The authors use two different configurations for their DPLL(T) solver, one general and one specialized with heuristics for Max-SAT.
They use three configurations for Toolbar: the default one, one with a static branching heuristic, and one with a Jeroslow-Wang heuristic recommended by the Toolbar authors.
For unknown reasons, they only use the general DPLL(T) configuration for the radio frequency problem, and only use the default Toolbar configuration for the benchmarks.

## Results

Overall, DPLL(T) is the fastest solver among all tested for all Max-SAT benchmarks except three: Toolbar is 2x faster for the DIMACS "jnh" benchmark,
MiniSat+ is 2x faster for the DIMACS "dubois" benchmark, and Pueblo is 9x faster for the DIMACS "hole" benchmark. General DPLL(T) handily wins in other benchmarks,
especially in the privately obtained "Quasi-groups" benchmarks in which it beats Pueblo by 2x, MiniSat+ by 30x or so, and Toolbar because the latter times out after 10 minutes on almost all queries.

Somewhat surprisingly, the addition of specialized heuristics for DPLL(T) does not help on the benchmarks; aside from one query in which general DPLL(T) times out after 10 minutes but
specialized DPLL(T) finds an assignment, specialized DPLL(T) loses on other benchmarks, by up to 5x.

In the radio frequency example, the "Jeroslow" version of Toolbar is 1.5-5x faster for the first four queries but DPLL(T) is 25% faster for the last, and biggest, one.
DPLL(T) however handily beats the default and static versions of Toolbar.

The authors attempted a translation of the radio frequency queries into weighted Max-SAT and pseudo-Boolean problems to use Pueblo and MiniSat+, but these solvers
timed out after a day (!) on the second smallest query, which Toolbar and DPLL(T) solve in under 2 minutes.

## Implications

Overall, the results do not show that DPLL(T) is always more efficient, but they do show that Max-SMT can be used to solve well-known problems that are not typically
thought of as SMT problems, such as the radio frequency problem, without the need for a specialized solver.


# References
