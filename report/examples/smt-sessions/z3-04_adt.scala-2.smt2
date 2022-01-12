; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12 () Bool)

(assert start!12)

(assert (=> start!12 false))

(check-sat)
