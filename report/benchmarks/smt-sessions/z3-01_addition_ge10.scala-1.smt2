; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4 () Bool)

(assert start!4)

(declare-fun x!110 () (_ BitVec 32))

(minimize (ite (bvsge x!110 #b00000000000000000000000000000000) x!110 (bvneg x!110)))
(declare-fun y!21 () (_ BitVec 32))

(minimize (ite (bvsge y!21 #b00000000000000000000000000000000) y!21 (bvneg y!21)))
(assert (=> start!4 (and (or (not (= (bvand x!110 #b10000000000000000000000000000000) (bvand y!21 #b10000000000000000000000000000000))) (= (bvand x!110 #b10000000000000000000000000000000) (bvand (bvadd x!110 y!21) #b10000000000000000000000000000000))) (bvslt (bvadd x!110 y!21) #b00000000000000000000000000001010))))

(assert (=> start!4 true))

(check-sat)
(get-model)

