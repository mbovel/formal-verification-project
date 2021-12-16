---
title: Minimizing Stainless counter-examples
author: Solal Pirelli, Matt Bovel
---

# Problem

<insert Stainless example with poor counter-example here>


# Problem

Solver can choose _any_ SAT assignment

Counter-examples could be arbitrarily large


# What we want

_Minimal_ counter-example

e.g.

<insert minimal counter-example here>


# What we want

"Minimal" is blurry over many vars -> sum?

"Minimal" is blurry over non-ints -> "size" of types?


# How?

"On SAT Modulo Theories and Optimization Problems"

_Robert Nieuwenhuis and Albert Oliveras, 2006_


# Max-SMT

= Max + SMT

"Find an assignment that maximizes X satisfying F(X)"


# Weighted Max-SMT

List of (weight, constraint) tuples

Maximize sum of satisfied constraint weights


# DPLL(T) strengthening

<how much detail to put here? may need 2-3 slides>


# What we use

Maximize / minimize operations

Already implemented in Z3


# Implementation

<Stainless/Inox/Z3 diagram here>


# Implementation

New solver type in Inox, Stainless's backend

No new code in Stainless needed


# Results

<insert example here, including command-line calling stainless with our solver>




# Scala

```scala
def (x: Int) = {
  x + 42
}
```

# Maths

Test

$$\begin{array}{lll}
\footnotesize
\textsf{Backjump: } & & \\
M \, l^d \, N \mathbin{||} F, C &\Longrightarrow M \, l' \mathbin{||} F, C &\textnormal{ if} \begin{cases}
M \, l^d \, N \models \lnot C \\
\textnormal{there exists a clause } C' \lor l' \textnormal{ such that:} \\
\qquad F, C \models C' \lor l' \textnormal{ and } M \models \lnot C', \\
\qquad l' \textnormal{ is undefined in } M \textnormal{ and} \\
\qquad l' \textnormal{ or } \lnot l' \textnormal{ occurs in } F \textnormal{ or in } M \, l^d \, N.
\end{cases} \\
\end{array}$$

$$\begin{array}{lll}
\footnotesize
\textsf{Backjump: } & & \\
M \, l^d \, N \mathbin{||} F, C &\Longrightarrow M \, l' \mathbin{||} F, C &\textnormal{ if} \begin{cases}
M \, l^d \, N \models \lnot C \\
\textnormal{there exists a clause } C' \lor l' \textnormal{ such that:} \\
\qquad F, C \models C' \lor l' \textnormal{ and } M \models \lnot C', \\
\qquad l' \textnormal{ is undefined in } M \textnormal{ and} \\
\qquad l' \textnormal{ or } \lnot l' \textnormal{ occurs in } F \textnormal{ or in } M \, l^d \, N.
\end{cases} \\
\end{array}$$