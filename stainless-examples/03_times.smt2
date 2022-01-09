; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2 () Bool)

(assert start!2)

(declare-fun n!18 () (_ BitVec 32))

(minimize (ite (bvsge n!18 #b00000000000000000000000000000000) n!18 (bvneg n!18)))
(assert (=> start!2 (bvslt (bvmul n!18 n!18) #b00000000000000000000000000001010)))

(assert (=> start!2 true))

(check-sat)
(get-model)

