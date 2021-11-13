---
documentclass: article
classoption:
- fleqn
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
    \usepackage{amsmath}
    \newtheorem{definition}{Definition}
    \newtheorem{example}{Example}
    \def\bibfont{\footnotesize}
bibliography: bib.bib
biblio-style: plain
geometry: "left=3cm,right=3cm,top=2cm,bottom=2cm"
numbersections: true
---

# Introduction

Solvers for _SAT Modulo Theories (SMT)_ can solve are widely used to solve _satisfiability_ problems over many different theories. The reviewed paper introduces a variant of the _DPLL Modulo Theories (DPLL(T))_ algorithm that enables not only to find a valid model $M$ for a given formula $F$ withing a given theory $T$, but also to make it _optimal_ with respect to a cost function _f(M)_. This opens the gate to solving problems that were previously out of the scope of SMT solvers, such as Max-SAT and Max-SMT (for which a specific example is given with the radio bandwidth allocation problem).

In this review, we first give a quick introduction to the _DPLL_ and _DPLL(T)_ algorithms, before diving into the contribution that the reviewed paper makes: _DPLL(T) with strengthening_. We illustrate these with the formal definitions, with toy implementations in Scala available on GitHub [@samples] and by discussing the examples presented in the paper. Finally, we discuss the "Benchmarks" part and conclude with general thoughts on the paper.

# Preliminaries

_DPLL_ is an algorithm solving the _boolean satisfiability problem (SAT)_: finding an assignment of variables for a formula $F$ such that it evaluates to true. It is formalized as a set of rules deriving a final _state_ $S$ from a start state $S_0$. This allows to reason easily about it and to prove properties such as termination.

A state either the final $FailState$ state indicating that no model was found, or a pair $F \mathbin{||} M$, where $F$ is the formula to satisfy, in _conjunctive normal form (CNF)_, and _M_ is a partial assignment of the variables of $F$ to boolean values.

\begin{definition}[Classic DPLL]
As described in \citep[p.941]{solving_sat}.
$$\begin{array}{lll}
\textsf{UnitPropagate: } & & \\
M \mathbin{||} F, C \lor l &\Longrightarrow M \mathbin{||} F, C \lor l &\textnormal{ if} \begin{cases}
M \models \lnot C \\
l \textnormal{ is undefined in } M.
\end{cases} \\
\textsf{PureLiteral: } & & \\
M \mathbin{||} F \lor l &\Longrightarrow M \, l \mathbin{||} F \lor l &\textnormal{ if} \begin{cases}
l \textnormal{ occurs in some clause of } F \\
\lnot l \textnormal{ occurs in no clause of } F \\
l \textnormal{ is undefined in } M.
\end{cases} \\
\textsf{Decide: } & & \\
M \mathbin{||} F &\Longrightarrow M \, l^d \mathbin{||} F &\textnormal{ if} \begin{cases}
l \textnormal{ or } \lnot l \textnormal{ occurs in a clause of } F \\
l \textnormal{ is undefined in } M.
\end{cases} \\
\textsf{Fail: } & & \\
M \mathbin{||} F, C &\Longrightarrow FailState &\textnormal{ if} \begin{cases}
M \models \lnot C \\
M \textnormal{ contains no decision literals}.
\end{cases} \\
\textsf{Backtrack: } & & \\
M \, l^d \, N \mathbin{||} F, C &\Longrightarrow M \, \lnot l \mathbin{||} F, C &\textnormal{ if} \begin{cases}
M \, l^d \, N \models \lnot C \\
N \textnormal{ contains no decision literals}.
\end{cases} \\
\end{array}$$
\end{definition}

\begin{example}[Classical DPLL example derivation]

\end{example}

\begin{definition}[Basic DPLL]

As described in \citep[p.944]{solving_sat}, replacing the rule "Backtrack" in "Classic DPLL":

$$\begin{array}{lll}
\textsf{Backjump: } & & \\
M \, l^d \, N \mathbin{||} F, C &\Longrightarrow M \, l' \mathbin{||} F, C &\textnormal{ if} \begin{cases}
M \, l^d \, N \models \lnot C \\
\textnormal{there exists a clause } C' \lor l' \textnormal{ such that:} \\
\qquad F, C \models C' \lor l' \textnormal{ and } M \models \lnot C', \\
\qquad l' \textnormal{ is undefined in } M \textnormal{ and} \\
\qquad l' \textnormal{ or } \lnot l' \textnormal{ occurs in } F \textnormal{ or in } M \, l^d \, N.
\end{cases} \\
\end{array}$$

\end{definition}

[@solving_sat, p. 952-958] (Restart), [@solving_sat, p.957] (Theory Learn, Theory Forget), [@solving_sat, p.958] (Theory Propagate)

\begin{definition}[DPLL Modulo Theories]

In addition to the rules of "Basic DPLL", without "PureLitteral" (and adapting "Backjump"):

$$\begin{array}{lll}
\textsf{Restart: } & & \\
T \mathbin{||} M \mathbin{||} F &\Longrightarrow T \mathbin{||} \emptyset \mathbin{||} F & \\
& & \\
\textsf{Theory Learn: } & & \\
T \mathbin{||} M \mathbin{||} F &\Longrightarrow T \mathbin{||} M \mathbin{||} F, C &\textnormal{ if} \begin{cases}
\textnormal{ each atom of } C \textnormal{ is in } F \textnormal{ or in } M \\
F \models_T C.
\end{cases} \\
\textsf{Theory forget: } & & \\
T \mathbin{||} M \mathbin{||} F, C &\Longrightarrow T \mathbin{||} M \mathbin{||} F &\textnormal{ if} \begin{cases}
F \models_T C.
\end{cases} \\
& & \\
\textsf{Theory Propagate: } & & \\
T \mathbin{||} M \mathbin{||} F &\Longrightarrow T \mathbin{||} M \, l' \mathbin{||} F &\textnormal{ if} \begin{cases}
M \models_T l \\
l' \textnormal{ or } \lnot l' \textnormal{ occurs in } F \\
l \textnormal{ is undefined in } M.
\end{cases} \\
\end{array}$$
\end{definition}

# Body

## Contribution

\begin{definition}[Strengthening DPLL Modulo Theories]

$$\begin{array}{lll}
\textsf{Theory Strenghten: } & & \\
T \mathbin{||} M \mathbin{||} F &\Longrightarrow T \land T' \mathbin{||} M \mathbin{||} F & \\
\end{array}$$

\end{definition}

## Application: Max-SAT

Definition 2 of §2.2 + high-level overview of the proofs in §2.3.
Explain §3, maybe make it more prominent (it's quite small in the paper)
Explain §4.1 and §4.2.

## Application: Max-SMT and difference logic

The paper shows how the approach can be extended to Max-SMT using the example of weighted Max-SMT modulo Integer Difference Logic ("QF_IDL" in SMT terms),
which consists of Boolean combinations of $a - b \le k$ inequations with $a, b$ integer variables and $k$ an integer constant.

Integer Difference Logic is typically used for verification, but the paper shows it can also be useful in an unexpected context: radio frequency assignment [@celar].
The goal is to assign frequencies to radio links in a way that minimizes interference: some links must be at specific frequency distances, while others have
"soft" constraints specifying a minimum distance that should ideally be respected.

Radio frequency assignment is encodable in Integer Difference Logic thanks to the authors' observation that the set of available frequencies for any given radio link
can be seen as the disjoint union of four sets, each constraining the frequency $k$ to be $n + mk$ | $a \le k \le b$ with $n, m, a, b$ integer constants.
This observation is unfortunately not justified in the paper and not mentioned in the original paper describing
the problem [@celar] either; it may be an artifact of practical considerations given that this problem is a real-world one.

The key idea is to encode these disjoint sets using on the one hand Boolean variables determining which set is picked and on the other hand integer variables
defining the frequency modulo $m$.
Constraints on the distance between frequencies of specific links can be naturally defined in Integer Difference Logic since they match the logic's inequality shape.


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


# Conclusion

This paper proposes a variant of SMT in which a theory can be strengthened at will, in order to find answers to Max-SMT problems.
The paper uses the DPLL framework to prove their variant correct, which allows them to extend an existing DPLL solver with little effort.
The resulting solver can handle a well-known "hard" problem, radio frequency assignment, which is not typically thought of as an SMT problem
since it requires optimization and not only satisfiability.

The main strength of the paper is that it explains DPLL(T) and the authors' proposed strengthening very well. The contribution is not just useful
but also simple enough to understand, and the resulting solver has comparable performance to more complex solvers.

However, the empirical evaluation leaves much to be desired, as the exact benchmarks used are not specified and the results are not always
in the new solver's favor. The main evaluation outcome is that the solver is "good enough" compared to more complex ones,
but it is entirely possible that with different sets of benchmarks the results could be very different.

We plan on using Max-SMT in order to improve the counter-example generation of a theorem prover such as Stainless.
Stainless can use Z3 [@z3], which implements optimization strategies [@z3opt] similar to those described in this paper.
Thus, we should be able to minimize counter-examples by finding a function that maps an example to its complexity (which is somewhat subjective) and asking Z3 to minimize
the function's output on the example.


# References
