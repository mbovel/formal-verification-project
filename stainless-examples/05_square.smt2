; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1 () Bool)

(assert start!1)

(declare-fun k0!0 () Int)

(assert (=> start!1 (>= k0!0 (- 2))))

(declare-fun bs!1 () Bool)

(assert (= bs!1 start!1))

(declare-fun m!1 () Bool)

(assert (=> bs!1 m!1))

(check-sat (not start!1))
(check-sat)
(get-model)

(declare-fun d!1 () Bool)

(assert (=> d!1 true))

(assert (=> d!1 true))

(declare-fun res!4 () Int)

(minimize (ite (>= res!4 0) res!4 (- res!4)))
(assert (=> d!1 (= k0!0 res!4)))

(assert (=> start!1 d!1))

(check-sat)
(get-model)

