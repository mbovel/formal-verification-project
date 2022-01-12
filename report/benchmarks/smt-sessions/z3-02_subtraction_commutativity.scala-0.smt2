; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2 () Bool)

(assert start!2)

(declare-fun x!110 () (_ BitVec 32))

(minimize (ite (bvsge x!110 #b00000000000000000000000000000000) x!110 (bvneg x!110)))
(declare-fun y!21 () (_ BitVec 32))

(minimize (ite (bvsge y!21 #b00000000000000000000000000000000) y!21 (bvneg y!21)))
(assert (=> start!2 (and (not (= (bvand x!110 #b10000000000000000000000000000000) (bvand y!21 #b10000000000000000000000000000000))) (not (= (bvand x!110 #b10000000000000000000000000000000) (bvand (bvsub x!110 y!21) #b10000000000000000000000000000000))))))

(assert (=> start!2 true))

(check-sat)
(get-model)

