; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1 () Bool)

(assert start!1)

(declare-fun fact!0 (Int) Int)

(declare-fun k0!0 () Int)

(assert (=> start!1 (>= (fact!0 k0!0) 15)))

(declare-fun bs!1 () Bool)

(assert (= bs!1 start!1))

(declare-fun m!1 () Bool)

(assert (=> bs!1 m!1))

(assert (=> bs!1 m!1))

(declare-fun m!3 () Bool)

(assert (=> bs!1 m!3))

(check-sat (not start!1))
(check-sat)
(get-model)

(declare-fun d!1 () Bool)

(declare-fun c!2 () Bool)

(assert (=> d!1 (= c!2 (= k0!0 0))))

(declare-fun e!2 () Int)

(minimize (ite (>= e!2 0) e!2 (- e!2)))
(assert (=> d!1 (= (fact!0 k0!0) e!2)))

(minimize (ite (>= e!2 0) e!2 (- e!2)))
(declare-fun b!4 () Bool)

(assert (=> b!4 (= e!2 1)))

(minimize (ite (>= e!2 0) e!2 (- e!2)))
(declare-fun b!5 () Bool)

(assert (=> b!5 (= e!2 (* (fact!0 (- k0!0 1)) k0!0))))

(assert (= (and d!1 c!2) b!4))

(assert (= (and d!1 (not c!2)) b!5))

(declare-fun m!5 () Bool)

(assert (=> b!5 m!5))

(assert (=> start!1 d!1))

(declare-fun d!3 () Bool)

(assert (=> d!3 true))

(assert (=> d!3 true))

(declare-fun res!4 () Int)

(minimize (ite (>= res!4 0) res!4 (- res!4)))
(assert (=> d!3 (= k0!0 res!4)))

(assert (=> start!1 d!3))

(check-sat (not b!5))
(check-sat)
(get-model)

(declare-fun d!5 () Bool)

(declare-fun c!3 () Bool)

(assert (=> d!5 (= c!3 (= (- k0!0 1) 0))))

(declare-fun e!3 () Int)

(minimize (ite (>= e!3 0) e!3 (- e!3)))
(assert (=> d!5 (= (fact!0 (- k0!0 1)) e!3)))

(minimize (ite (>= e!3 0) e!3 (- e!3)))
(declare-fun b!6 () Bool)

(assert (=> b!6 (= e!3 1)))

(minimize (ite (>= e!3 0) e!3 (- e!3)))
(declare-fun b!7 () Bool)

(assert (=> b!7 (= e!3 (* (fact!0 (- (- k0!0 1) 1)) (- k0!0 1)))))

(assert (= (and d!5 c!3) b!6))

(assert (= (and d!5 (not c!3)) b!7))

(declare-fun m!7 () Bool)

(assert (=> b!7 m!7))

(assert (=> b!5 d!5))

(check-sat (not b!7))
(check-sat)
(get-model)

(declare-fun d!7 () Bool)

(declare-fun c!4 () Bool)

(assert (=> d!7 (= c!4 (= (- (- k0!0 1) 1) 0))))

(declare-fun e!4 () Int)

(minimize (ite (>= e!4 0) e!4 (- e!4)))
(assert (=> d!7 (= (fact!0 (- (- k0!0 1) 1)) e!4)))

(minimize (ite (>= e!4 0) e!4 (- e!4)))
(declare-fun b!8 () Bool)

(assert (=> b!8 (= e!4 1)))

(minimize (ite (>= e!4 0) e!4 (- e!4)))
(declare-fun b!9 () Bool)

(assert (=> b!9 (= e!4 (* (fact!0 (- (- (- k0!0 1) 1) 1)) (- (- k0!0 1) 1)))))

(assert (= (and d!7 c!4) b!8))

(assert (= (and d!7 (not c!4)) b!9))

(declare-fun m!9 () Bool)

(assert (=> b!9 m!9))

(assert (=> b!7 d!7))

(check-sat (not b!9))
(check-sat)
(get-model)

(declare-fun d!9 () Bool)

(declare-fun c!5 () Bool)

(assert (=> d!9 (= c!5 (= (- (- (- k0!0 1) 1) 1) 0))))

(declare-fun e!5 () Int)

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(assert (=> d!9 (= (fact!0 (- (- (- k0!0 1) 1) 1)) e!5)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun b!10 () Bool)

(assert (=> b!10 (= e!5 1)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun b!11 () Bool)

(assert (=> b!11 (= e!5 (* (fact!0 (- (- (- (- k0!0 1) 1) 1) 1)) (- (- (- k0!0 1) 1) 1)))))

(assert (= (and d!9 c!5) b!10))

(assert (= (and d!9 (not c!5)) b!11))

(declare-fun m!11 () Bool)

(assert (=> b!11 m!11))

(assert (=> b!9 d!9))

(check-sat (not b!11))
(check-sat)
(get-model)

(declare-fun d!11 () Bool)

(declare-fun c!6 () Bool)

(assert (=> d!11 (= c!6 (= (- (- (- (- k0!0 1) 1) 1) 1) 0))))

(declare-fun e!6 () Int)

(minimize (ite (>= e!6 0) e!6 (- e!6)))
(assert (=> d!11 (= (fact!0 (- (- (- (- k0!0 1) 1) 1) 1)) e!6)))

(minimize (ite (>= e!6 0) e!6 (- e!6)))
(declare-fun b!12 () Bool)

(assert (=> b!12 (= e!6 1)))

(minimize (ite (>= e!6 0) e!6 (- e!6)))
(declare-fun b!13 () Bool)

(assert (=> b!13 (= e!6 (* (fact!0 (- (- (- (- (- k0!0 1) 1) 1) 1) 1)) (- (- (- (- k0!0 1) 1) 1) 1)))))

(assert (= (and d!11 c!6) b!12))

(assert (= (and d!11 (not c!6)) b!13))

(declare-fun m!13 () Bool)

(assert (=> b!13 m!13))

(assert (=> b!11 d!11))

(check-sat (not b!13))
(get-model)

