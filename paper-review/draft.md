(in quoted text the stuff from Viktor's template file)

# Introduction

> Say a few general words about the general context of the paper you chose.
> Explain why the topic is of interest, or where it can be applied.
> If it is about a piece of software or artifact, give a description of it. 
> State the main result of the paper and why it is new or how it improves on previous state of knowledge. 
> You can cite references using, for example \cite{BibliographyManagementLaTeX} and make a succint presentation of the organisation of your report.

SMT solvers can solve satisfiability problems in theories such as bitvectors, but sometimes problems need more than a "satisfiable"/"unsatisfiable" decision.
This paper introduces an algorithm to make _optimization_ decisions, such as minimizing a specific number.
The paper shows that such an algorithm allows SMT solvers to be applied to more problems, such as radio bandwidth allocation.

Maybe we should introduce the radio frequency allocation as a running example here, and use it throughout the report, rather than the paper only doing this at the end.


# Preliminaries

> State the technical details that are necessary to understand the paper. 
> It is generally a collection of definitions, concepts and notations with potentially a few preliminary results. 
> It can be, for example the mathematical framework in which the topic of your paper is expressed. 
> In particular, fix the notation you will be using for your review.

Talk about DPLL here.
The paper does a good job of explaining how SMT solvers work, we can restate it in our words.
Basically, §2.2 of the paper goes here except Definition 2 (which is part of the body).
Also we probably should have some general explanation about SAT solving first.


# Body

> Explain the paper, in your own words. 
> Don't go into as many details as the original text, but the person reading your review should have a general understanding of the paper's results 
> and how those results can be obtained. The structure and content of this section of course heavily depends on the paper itself. 
> Don't hesitate to split it in multiple sections or subsections, for example:
> \subsection{An algorithm for whatever problem we try to solve}
> If your paper contains theorems, sketch the proofs of important theorems. 

Definition 2 of §2.2 + high-level overview of the proofs in §2.3.
Explain §3, maybe make it more prominent (it's quite small in the paper)
Explain §4.1 and §4.2.
Explain §5.1.


# Benchmarks

> If it contains benchmarks, show the key scores or results.
> You can follow the structure of the paper you're reviewing, but write with your own words.

§4.3 and §5.2.


# Conclusion

> Recall briefly what the paper achieves, and how it is new. 
> Express your critical skill on the paper and explain what you think are the strong and weak points of the paper. 
> Also tell how you could potentially use the paper's results in your future project. 
> You can also suggest further work or extensions to the paper.

§6.
Relate to what Z3 can do today, with some examples.
Explain how this can be used in Stainless, or more generally in any prover.
