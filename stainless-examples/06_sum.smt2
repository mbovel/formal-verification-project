; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1 () Bool)

(assert start!1)

(declare-fun res!9 () Bool)

(declare-fun e!2 () Bool)

(assert (=> start!1 (=> (not res!9) (not e!2))))

(declare-fun l!0 () Int)

(declare-fun sumToTen!0 (Int) Int)

(declare-fun k0!0 () Int)

(assert (=> start!1 (= res!9 (= l!0 (sumToTen!0 k0!0)))))

(assert (=> start!1 e!2))

(declare-fun b!6 () Bool)

(declare-fun res!10 () Bool)

(assert (=> b!6 (=> (not res!10) (not e!2))))

(assert (=> b!6 (= res!10 (>= k0!0 0))))

(declare-fun b!7 () Bool)

(declare-fun res!11 () Bool)

(assert (=> b!7 (=> (not res!11) (not e!2))))

(assert (=> b!7 (= res!11 (>= l!0 4))))

(declare-fun b!8 () Bool)

(assert (=> b!8 (= e!2 (<= l!0 7))))

(assert (= (and start!1 res!9) b!6))

(assert (= (and b!6 res!10) b!7))

(assert (= (and b!7 res!11) b!8))

(declare-fun m!1 () Bool)

(assert (=> start!1 m!1))

(declare-fun m!3 () Bool)

(assert (=> start!1 m!3))

(assert (=> start!1 m!3))

(declare-fun m!5 () Bool)

(assert (=> start!1 m!5))

(assert (=> b!6 m!3))

(assert (=> b!7 m!1))

(assert (=> b!8 m!1))

(check-sat (not b!6) (not b!7) (not b!8) (not start!1))
(check-sat)
(get-model)

(declare-fun d!1 () Bool)

(assert (=> d!1 true))

(assert (=> d!1 true))

(declare-fun res!14 () Int)

(minimize (ite (>= res!14 0) res!14 (- res!14)))
(assert (=> d!1 (= k0!0 res!14)))

(assert (=> b!6 d!1))

(declare-fun d!3 () Bool)

(assert (=> d!3 true))

(assert (=> d!3 true))

(declare-fun res!17 () Int)

(minimize (ite (>= res!17 0) res!17 (- res!17)))
(assert (=> d!3 (= l!0 res!17)))

(assert (=> b!7 d!3))

(assert (=> b!8 d!3))

(assert (=> start!1 d!3))

(declare-fun d!5 () Bool)

(declare-fun c!2 () Bool)

(assert (=> d!5 (= c!2 (>= k0!0 4))))

(declare-fun e!5 () Int)

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(assert (=> d!5 (= (sumToTen!0 k0!0) e!5)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun b!13 () Bool)

(assert (=> b!13 (= e!5 4)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun b!14 () Bool)

(assert (=> b!14 (= e!5 (+ (sumToTen!0 (+ k0!0 1)) k0!0))))

(assert (= (and d!5 c!2) b!13))

(assert (= (and d!5 (not c!2)) b!14))

(declare-fun m!7 () Bool)

(assert (=> b!14 m!7))

(assert (=> start!1 d!5))

(assert (=> start!1 d!1))

(check-sat (not b!14))
(get-model)

