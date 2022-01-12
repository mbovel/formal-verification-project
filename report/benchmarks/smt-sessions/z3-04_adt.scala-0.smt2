; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2 () Bool)

(assert start!2)

(declare-datatypes () ((BoxedInt!4 (BoxedInt!5 (value!35 Int)))))

(declare-datatypes () ((Complex!2 (UnboxedComplex!2 (a!36 Int) (b!31 Int)) (BoxedComplex!2 (a!37 BoxedInt!4) (b!32 BoxedInt!4)))))

(declare-fun z1!2 () Complex!2)

(get-info :version)

(minimize (ite ((_ is UnboxedComplex!2) z1!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (a!36 z1!2) 0) (a!36 z1!2) (- (a!36 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (b!31 z1!2) 0) (b!31 z1!2) (- (b!31 z1!2))) 0))
(declare-fun z2!2 () Complex!2)

(minimize (ite ((_ is UnboxedComplex!2) z2!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (a!36 z2!2) 0) (a!36 z2!2) (- (a!36 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (b!31 z2!2) 0) (b!31 z2!2) (- (b!31 z2!2))) 0))
(declare-fun mult!0 (Complex!2 Complex!2) Complex!2)

(assert (=> start!2 (not (= (mult!0 z1!2 z2!2) (mult!0 z2!2 z1!2)))))

(assert (=> start!2 true))

(declare-fun bs!1 () Bool)

(assert (= bs!1 start!2))

(declare-fun m!13 () Bool)

(assert (=> bs!1 m!13))

(declare-fun m!15 () Bool)

(assert (=> bs!1 m!15))

(check-sat (not start!2))
(check-sat)
(get-model)

(minimize (ite ((_ is UnboxedComplex!2) z1!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (a!36 z1!2) 0) (a!36 z1!2) (- (a!36 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (b!31 z1!2) 0) (b!31 z1!2) (- (b!31 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (a!36 z2!2) 0) (a!36 z2!2) (- (a!36 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (b!31 z2!2) 0) (b!31 z2!2) (- (b!31 z2!2))) 0))
(declare-fun d!1 () Bool)

(declare-fun getRealPart!0 (Complex!2) Int)

(declare-fun getImaginaryPart!0 (Complex!2) Int)

(assert (=> d!1 (= (mult!0 z1!2 z2!2) (UnboxedComplex!2 (- (* (getRealPart!0 z1!2) (getRealPart!0 z2!2)) (* (getImaginaryPart!0 z1!2) (getImaginaryPart!0 z2!2))) (+ (* (getRealPart!0 z1!2) (getImaginaryPart!0 z2!2)) (* (getImaginaryPart!0 z1!2) (getRealPart!0 z1!2)))))))

(declare-fun bs!2 () Bool)

(assert (= bs!2 d!1))

(declare-fun m!17 () Bool)

(assert (=> bs!2 m!17))

(declare-fun m!19 () Bool)

(assert (=> bs!2 m!19))

(declare-fun m!21 () Bool)

(assert (=> bs!2 m!21))

(declare-fun m!23 () Bool)

(assert (=> bs!2 m!23))

(assert (=> start!2 d!1))

(minimize (ite ((_ is UnboxedComplex!2) z2!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (a!36 z2!2) 0) (a!36 z2!2) (- (a!36 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (b!31 z2!2) 0) (b!31 z2!2) (- (b!31 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (a!36 z1!2) 0) (a!36 z1!2) (- (a!36 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (b!31 z1!2) 0) (b!31 z1!2) (- (b!31 z1!2))) 0))
(declare-fun d!3 () Bool)

(assert (=> d!3 (= (mult!0 z2!2 z1!2) (UnboxedComplex!2 (- (* (getRealPart!0 z2!2) (getRealPart!0 z1!2)) (* (getImaginaryPart!0 z2!2) (getImaginaryPart!0 z1!2))) (+ (* (getRealPart!0 z2!2) (getImaginaryPart!0 z1!2)) (* (getImaginaryPart!0 z2!2) (getRealPart!0 z2!2)))))))

(declare-fun bs!3 () Bool)

(assert (= bs!3 d!3))

(assert (=> bs!3 m!19))

(assert (=> bs!3 m!17))

(assert (=> bs!3 m!23))

(assert (=> bs!3 m!21))

(assert (=> start!2 d!3))

(check-sat (not d!1) (not d!3))
(check-sat)
(get-model)

(minimize (ite ((_ is UnboxedComplex!2) z1!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (a!36 z1!2) 0) (a!36 z1!2) (- (a!36 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (b!31 z1!2) 0) (b!31 z1!2) (- (b!31 z1!2))) 0))
(declare-fun d!5 () Bool)

(assert (=> d!5 (= (getRealPart!0 z1!2) (ite ((_ is BoxedComplex!2) z1!2) (value!35 (a!37 z1!2)) (a!36 z1!2)))))

(assert (=> d!1 d!5))

(minimize (ite ((_ is UnboxedComplex!2) z2!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (a!36 z2!2) 0) (a!36 z2!2) (- (a!36 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (b!31 z2!2) 0) (b!31 z2!2) (- (b!31 z2!2))) 0))
(declare-fun d!7 () Bool)

(assert (=> d!7 (= (getRealPart!0 z2!2) (ite ((_ is BoxedComplex!2) z2!2) (value!35 (a!37 z2!2)) (a!36 z2!2)))))

(assert (=> d!1 d!7))

(minimize (ite ((_ is UnboxedComplex!2) z2!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (a!36 z2!2) 0) (a!36 z2!2) (- (a!36 z2!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z2!2) (ite (>= (b!31 z2!2) 0) (b!31 z2!2) (- (b!31 z2!2))) 0))
(declare-fun d!9 () Bool)

(assert (=> d!9 (= (getImaginaryPart!0 z2!2) (ite ((_ is BoxedComplex!2) z2!2) (value!35 (b!32 z2!2)) (b!31 z2!2)))))

(assert (=> d!1 d!9))

(minimize (ite ((_ is UnboxedComplex!2) z1!2) #b0000000000000000000000000000000000000000000000000000000000001010 #b0000000000000000000000000000000000000000000000000000000000010100))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (a!36 z1!2) 0) (a!36 z1!2) (- (a!36 z1!2))) 0))
(minimize (ite ((_ is UnboxedComplex!2) z1!2) (ite (>= (b!31 z1!2) 0) (b!31 z1!2) (- (b!31 z1!2))) 0))
(declare-fun d!11 () Bool)

(assert (=> d!11 (= (getImaginaryPart!0 z1!2) (ite ((_ is BoxedComplex!2) z1!2) (value!35 (b!32 z1!2)) (b!31 z1!2)))))

(assert (=> d!1 d!11))

(assert (=> d!3 d!7))

(assert (=> d!3 d!5))

(assert (=> d!3 d!11))

(assert (=> d!3 d!9))

(check-sat)
(get-model)

