# Minimizing Stainless Counter-Examples

Course project for the course [Formal
Verification](https://edu.epfl.ch/coursebook/en/formal-verification-CS-550?cb_cycle=bama_cyclemaster&cb_section=in)
at EPFL, Winter 2021-2022.

This repository contains:

- A background review on the paper [On SAT modulo theories and optimization
  problems](https://dl.acm.org/doi/10.1007/11814948_18) in the [`paper-review`](./paper-review)
  folder.
- A toy implementation of Optimizing DPLL solver in Scala in the
  [`paper-test-implementation`](./paper-test-implementation) folder.
- The slides for oral presentation in the 
  [`presentation`](./presentation) folder.
- The project report in the
  [`report`](./presentation) folder.

## Abstract

[Stainless](https://stainless.epfl.ch) is a tool for verifying
[Scala](https://www.scala-lang.org) programs. It can prove that some invariants
inside a function hold for all possible arguments, or show counter-examples when
they exist.

These synthesized counter-examples are unfortunately often suboptimal in terms
of human-readability. For example, when asked to provide two Java integers whose
sum is smaller than 10, Stainless outputs "2'146'959'355 and -2'146'959'347".
While correct, the answer "0 and 0" would probably look more intuitive to most
human brains.

We address this problem by extending
[Inox](https://github.com/epfl-lara/inox)---the engine behind Stainless---to
make it able to find models that are not only valid, but also minimal with
respect to some notion of size. To this end, we leverage the optimizing
capabilities of the [Z3](https://github.com/Z3Prover/z3) backend.