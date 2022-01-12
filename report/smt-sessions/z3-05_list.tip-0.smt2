; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1 () Bool)

(assert start!1)

(declare-fun res!7 () Bool)

(declare-fun e!2 () Bool)

(assert (=> start!1 (=> (not res!7) (not e!2))))

(declare-datatypes () ((MyList!1 (MyNil!1) (MyCons!1 (x!3 Int) (xs!3 MyList!1)))))

(declare-fun myMin!0 (MyList!1) Int)

(declare-fun aList!0 () MyList!1)

(assert (=> start!1 (= res!7 (>= (myMin!0 aList!0) 0))))

(assert (=> start!1 e!2))

(declare-fun b!4 () Bool)

(declare-fun res!8 () Bool)

(assert (=> b!4 (=> (not res!8) (not e!2))))

(assert (=> b!4 (= res!8 (<= (myMin!0 aList!0) 999))))

(declare-fun b!5 () Bool)

(declare-fun myMax!0 (MyList!1) Int)

(assert (=> b!5 (= e!2 (not (= (myMin!0 aList!0) (myMax!0 aList!0))))))

(assert (= (and start!1 res!7) b!4))

(assert (= (and b!4 res!8) b!5))

(declare-fun m!1 () Bool)

(assert (=> start!1 m!1))

(assert (=> start!1 m!1))

(declare-fun m!3 () Bool)

(assert (=> start!1 m!3))

(assert (=> b!4 m!1))

(assert (=> b!4 m!1))

(assert (=> b!4 m!3))

(assert (=> b!5 m!1))

(assert (=> b!5 m!1))

(assert (=> b!5 m!3))

(assert (=> b!5 m!1))

(declare-fun m!5 () Bool)

(assert (=> b!5 m!5))

(check-sat (not b!5) (not start!1) (not b!4))
(check-sat)
(get-model)