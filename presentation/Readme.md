---
title: Adding support for model optimization in Stainless
author: Solal Pirelli Matt Bovel
---

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