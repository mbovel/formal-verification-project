; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10 () Bool)

(assert start!10)

(assert (=> start!10 false))

(check-sat)
