; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1 () Bool)

(assert start!1)

(declare-fun res!6 () Bool)

(declare-fun e!2 () Bool)

(assert (=> start!1 (=> (not res!6) (not e!2))))

(declare-datatypes () ((Tree!1 (Empty!1) (Node!1 (value!4 Int) (left!3 Tree!1) (right!3 Tree!1)))))

(declare-fun height!0 (Tree!1) Int)

(declare-fun aTree!0 () Tree!1)

(assert (=> start!1 (= res!6 (= (height!0 aTree!0) 2))))

(assert (=> start!1 e!2))

(declare-fun b!2 () Bool)

(declare-fun size!0 (Tree!1) Int)

(declare-fun treeSize!0 () Int)

(assert (=> b!2 (= e!2 (= (size!0 aTree!0) treeSize!0))))

(assert (= (and start!1 res!6) b!2))

(declare-fun m!1 () Bool)

(assert (=> start!1 m!1))

(assert (=> start!1 m!1))

(declare-fun m!3 () Bool)

(assert (=> start!1 m!3))

(assert (=> b!2 m!1))

(assert (=> b!2 m!1))

(declare-fun m!5 () Bool)

(assert (=> b!2 m!5))

(declare-fun m!7 () Bool)

(assert (=> b!2 m!7))

(check-sat (not start!1) (not b!2))
(check-sat)
(get-model)

(declare-fun d!1 () Bool)

(declare-fun c!2 () Bool)

(get-info :version)

(assert (=> d!1 (= c!2 ((_ is Empty!1) aTree!0))))

(declare-fun e!5 () Int)

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(assert (=> d!1 (= (height!0 aTree!0) e!5)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun b!7 () Bool)

(assert (=> b!7 (= e!5 0)))

(minimize (ite (>= e!5 0) e!5 (- e!5)))
(declare-fun lt!5 () Int)

(minimize (ite (>= lt!5 0) lt!5 (- lt!5)))
(declare-fun lt!4 () Int)

(minimize (ite (>= lt!4 0) lt!4 (- lt!4)))
(declare-fun b!8 () Bool)

(assert (=> b!8 (= e!5 (+ 1 (ite (>= lt!5 lt!4) lt!5 lt!4)))))

(minimize (ite (>= lt!4 0) lt!4 (- lt!4)))
(assert (=> b!8 (= lt!4 (height!0 (right!3 aTree!0)))))

(minimize (ite (>= lt!5 0) lt!5 (- lt!5)))
(assert (=> b!8 (= lt!5 (height!0 (left!3 aTree!0)))))

(assert (= (and d!1 c!2) b!7))

(assert (= (and d!1 (not c!2)) b!8))

(declare-fun m!9 () Bool)

(assert (=> b!8 m!9))

(declare-fun m!11 () Bool)

(assert (=> b!8 m!11))

(assert (=> start!1 d!1))

(declare-fun d!3 () Bool)

(assert (=> d!3 true))

(assert (=> d!3 true))

(declare-fun res!9 () Tree!1)

(minimize (ite ((_ is Empty!1) res!9) 1 4))
(minimize (ite ((_ is Empty!1) res!9) 0 (ite (>= (value!4 res!9) 0) (value!4 res!9) (- (value!4 res!9)))))
(assert (=> d!3 (= aTree!0 res!9)))

(assert (=> start!1 d!3))

(declare-fun d!5 () Bool)

(declare-fun c!5 () Bool)

(assert (=> d!5 (= c!5 ((_ is Empty!1) aTree!0))))

(declare-fun e!8 () Int)

(minimize (ite (>= e!8 0) e!8 (- e!8)))
(assert (=> d!5 (= (size!0 aTree!0) e!8)))

(minimize (ite (>= e!8 0) e!8 (- e!8)))
(declare-fun b!13 () Bool)

(assert (=> b!13 (= e!8 0)))

(minimize (ite (>= e!8 0) e!8 (- e!8)))
(declare-fun b!14 () Bool)

(assert (=> b!14 (= e!8 (+ (+ 1 (size!0 (left!3 aTree!0))) (size!0 (right!3 aTree!0))))))

(assert (= (and d!5 c!5) b!13))

(assert (= (and d!5 (not c!5)) b!14))

(declare-fun m!13 () Bool)

(assert (=> b!14 m!13))

(declare-fun m!15 () Bool)

(assert (=> b!14 m!15))

(assert (=> b!2 d!5))

(assert (=> b!2 d!3))

(declare-fun d!7 () Bool)

(assert (=> d!7 true))

(assert (=> d!7 true))

(declare-fun res!12 () Int)

(minimize (ite (>= res!12 0) res!12 (- res!12)))
(assert (=> d!7 (= treeSize!0 res!12)))

(assert (=> b!2 d!7))

(check-sat (not b!14) (not b!8))
(check-sat)
(get-model)

(declare-fun d!9 () Bool)

(declare-fun c!6 () Bool)

(assert (=> d!9 (= c!6 ((_ is Empty!1) (left!3 aTree!0)))))

(declare-fun e!9 () Int)

(minimize (ite (>= e!9 0) e!9 (- e!9)))
(assert (=> d!9 (= (size!0 (left!3 aTree!0)) e!9)))

(minimize (ite (>= e!9 0) e!9 (- e!9)))
(declare-fun b!15 () Bool)

(assert (=> b!15 (= e!9 0)))

(minimize (ite (>= e!9 0) e!9 (- e!9)))
(declare-fun b!16 () Bool)

(assert (=> b!16 (= e!9 (+ (+ 1 (size!0 (left!3 (left!3 aTree!0)))) (size!0 (right!3 (left!3 aTree!0)))))))

(assert (= (and d!9 c!6) b!15))

(assert (= (and d!9 (not c!6)) b!16))

(declare-fun m!17 () Bool)

(assert (=> b!16 m!17))

(declare-fun m!19 () Bool)

(assert (=> b!16 m!19))

(assert (=> b!14 d!9))

(declare-fun d!11 () Bool)

(declare-fun c!7 () Bool)

(assert (=> d!11 (= c!7 ((_ is Empty!1) (right!3 aTree!0)))))

(declare-fun e!10 () Int)

(minimize (ite (>= e!10 0) e!10 (- e!10)))
(assert (=> d!11 (= (size!0 (right!3 aTree!0)) e!10)))

(minimize (ite (>= e!10 0) e!10 (- e!10)))
(declare-fun b!17 () Bool)

(assert (=> b!17 (= e!10 0)))

(minimize (ite (>= e!10 0) e!10 (- e!10)))
(declare-fun b!18 () Bool)

(assert (=> b!18 (= e!10 (+ (+ 1 (size!0 (left!3 (right!3 aTree!0)))) (size!0 (right!3 (right!3 aTree!0)))))))

(assert (= (and d!11 c!7) b!17))

(assert (= (and d!11 (not c!7)) b!18))

(declare-fun m!21 () Bool)

(assert (=> b!18 m!21))

(declare-fun m!23 () Bool)

(assert (=> b!18 m!23))

(assert (=> b!14 d!11))

(declare-fun d!13 () Bool)

(declare-fun c!8 () Bool)

(assert (=> d!13 (= c!8 ((_ is Empty!1) (right!3 aTree!0)))))

(declare-fun e!11 () Int)

(minimize (ite (>= e!11 0) e!11 (- e!11)))
(assert (=> d!13 (= (height!0 (right!3 aTree!0)) e!11)))

(minimize (ite (>= e!11 0) e!11 (- e!11)))
(declare-fun b!19 () Bool)

(assert (=> b!19 (= e!11 0)))

(minimize (ite (>= e!11 0) e!11 (- e!11)))
(declare-fun lt!7 () Int)

(minimize (ite (>= lt!7 0) lt!7 (- lt!7)))
(declare-fun lt!6 () Int)

(minimize (ite (>= lt!6 0) lt!6 (- lt!6)))
(declare-fun b!20 () Bool)

(assert (=> b!20 (= e!11 (+ 1 (ite (>= lt!7 lt!6) lt!7 lt!6)))))

(minimize (ite (>= lt!6 0) lt!6 (- lt!6)))
(assert (=> b!20 (= lt!6 (height!0 (right!3 (right!3 aTree!0))))))

(minimize (ite (>= lt!7 0) lt!7 (- lt!7)))
(assert (=> b!20 (= lt!7 (height!0 (left!3 (right!3 aTree!0))))))

(assert (= (and d!13 c!8) b!19))

(assert (= (and d!13 (not c!8)) b!20))

(declare-fun m!25 () Bool)

(assert (=> b!20 m!25))

(declare-fun m!27 () Bool)

(assert (=> b!20 m!27))

(assert (=> b!8 d!13))

(declare-fun d!15 () Bool)

(declare-fun c!9 () Bool)

(assert (=> d!15 (= c!9 ((_ is Empty!1) (left!3 aTree!0)))))

(declare-fun e!12 () Int)

(minimize (ite (>= e!12 0) e!12 (- e!12)))
(assert (=> d!15 (= (height!0 (left!3 aTree!0)) e!12)))

(minimize (ite (>= e!12 0) e!12 (- e!12)))
(declare-fun b!21 () Bool)

(assert (=> b!21 (= e!12 0)))

(minimize (ite (>= e!12 0) e!12 (- e!12)))
(declare-fun lt!9 () Int)

(minimize (ite (>= lt!9 0) lt!9 (- lt!9)))
(declare-fun lt!8 () Int)

(minimize (ite (>= lt!8 0) lt!8 (- lt!8)))
(declare-fun b!22 () Bool)

(assert (=> b!22 (= e!12 (+ 1 (ite (>= lt!9 lt!8) lt!9 lt!8)))))

(minimize (ite (>= lt!8 0) lt!8 (- lt!8)))
(assert (=> b!22 (= lt!8 (height!0 (right!3 (left!3 aTree!0))))))

(minimize (ite (>= lt!9 0) lt!9 (- lt!9)))
(assert (=> b!22 (= lt!9 (height!0 (left!3 (left!3 aTree!0))))))

(assert (= (and d!15 c!9) b!21))

(assert (= (and d!15 (not c!9)) b!22))

(declare-fun m!29 () Bool)

(assert (=> b!22 m!29))

(declare-fun m!31 () Bool)

(assert (=> b!22 m!31))

(assert (=> b!8 d!15))

(check-sat (not b!18) (not b!16) (not b!20) (not b!22))
(check-sat)
(get-model)

(declare-fun d!17 () Bool)

(declare-fun c!10 () Bool)

(assert (=> d!17 (= c!10 ((_ is Empty!1) (left!3 (right!3 aTree!0))))))

(declare-fun e!13 () Int)

(minimize (ite (>= e!13 0) e!13 (- e!13)))
(assert (=> d!17 (= (size!0 (left!3 (right!3 aTree!0))) e!13)))

(minimize (ite (>= e!13 0) e!13 (- e!13)))
(declare-fun b!23 () Bool)

(assert (=> b!23 (= e!13 0)))

(minimize (ite (>= e!13 0) e!13 (- e!13)))
(declare-fun b!24 () Bool)

(assert (=> b!24 (= e!13 (+ (+ 1 (size!0 (left!3 (left!3 (right!3 aTree!0))))) (size!0 (right!3 (left!3 (right!3 aTree!0))))))))

(assert (= (and d!17 c!10) b!23))

(assert (= (and d!17 (not c!10)) b!24))

(declare-fun m!33 () Bool)

(assert (=> b!24 m!33))

(declare-fun m!35 () Bool)

(assert (=> b!24 m!35))

(assert (=> b!18 d!17))

(declare-fun d!19 () Bool)

(declare-fun c!11 () Bool)

(assert (=> d!19 (= c!11 ((_ is Empty!1) (right!3 (right!3 aTree!0))))))

(declare-fun e!14 () Int)

(minimize (ite (>= e!14 0) e!14 (- e!14)))
(assert (=> d!19 (= (size!0 (right!3 (right!3 aTree!0))) e!14)))

(minimize (ite (>= e!14 0) e!14 (- e!14)))
(declare-fun b!25 () Bool)

(assert (=> b!25 (= e!14 0)))

(minimize (ite (>= e!14 0) e!14 (- e!14)))
(declare-fun b!26 () Bool)

(assert (=> b!26 (= e!14 (+ (+ 1 (size!0 (left!3 (right!3 (right!3 aTree!0))))) (size!0 (right!3 (right!3 (right!3 aTree!0))))))))

(assert (= (and d!19 c!11) b!25))

(assert (= (and d!19 (not c!11)) b!26))

(declare-fun m!37 () Bool)

(assert (=> b!26 m!37))

(declare-fun m!39 () Bool)

(assert (=> b!26 m!39))

(assert (=> b!18 d!19))

(declare-fun d!21 () Bool)

(declare-fun c!12 () Bool)

(assert (=> d!21 (= c!12 ((_ is Empty!1) (left!3 (left!3 aTree!0))))))

(declare-fun e!15 () Int)

(minimize (ite (>= e!15 0) e!15 (- e!15)))
(assert (=> d!21 (= (size!0 (left!3 (left!3 aTree!0))) e!15)))

(minimize (ite (>= e!15 0) e!15 (- e!15)))
(declare-fun b!27 () Bool)

(assert (=> b!27 (= e!15 0)))

(minimize (ite (>= e!15 0) e!15 (- e!15)))
(declare-fun b!28 () Bool)

(assert (=> b!28 (= e!15 (+ (+ 1 (size!0 (left!3 (left!3 (left!3 aTree!0))))) (size!0 (right!3 (left!3 (left!3 aTree!0))))))))

(assert (= (and d!21 c!12) b!27))

(assert (= (and d!21 (not c!12)) b!28))

(declare-fun m!41 () Bool)

(assert (=> b!28 m!41))

(declare-fun m!43 () Bool)

(assert (=> b!28 m!43))

(assert (=> b!16 d!21))

(declare-fun d!23 () Bool)

(declare-fun c!13 () Bool)

(assert (=> d!23 (= c!13 ((_ is Empty!1) (right!3 (left!3 aTree!0))))))

(declare-fun e!16 () Int)

(minimize (ite (>= e!16 0) e!16 (- e!16)))
(assert (=> d!23 (= (size!0 (right!3 (left!3 aTree!0))) e!16)))

(minimize (ite (>= e!16 0) e!16 (- e!16)))
(declare-fun b!29 () Bool)

(assert (=> b!29 (= e!16 0)))

(minimize (ite (>= e!16 0) e!16 (- e!16)))
(declare-fun b!30 () Bool)

(assert (=> b!30 (= e!16 (+ (+ 1 (size!0 (left!3 (right!3 (left!3 aTree!0))))) (size!0 (right!3 (right!3 (left!3 aTree!0))))))))

(assert (= (and d!23 c!13) b!29))

(assert (= (and d!23 (not c!13)) b!30))

(declare-fun m!45 () Bool)

(assert (=> b!30 m!45))

(declare-fun m!47 () Bool)

(assert (=> b!30 m!47))

(assert (=> b!16 d!23))

(declare-fun d!25 () Bool)

(declare-fun c!14 () Bool)

(assert (=> d!25 (= c!14 ((_ is Empty!1) (right!3 (right!3 aTree!0))))))

(declare-fun e!17 () Int)

(minimize (ite (>= e!17 0) e!17 (- e!17)))
(assert (=> d!25 (= (height!0 (right!3 (right!3 aTree!0))) e!17)))

(minimize (ite (>= e!17 0) e!17 (- e!17)))
(declare-fun b!31 () Bool)

(assert (=> b!31 (= e!17 0)))

(minimize (ite (>= e!17 0) e!17 (- e!17)))
(declare-fun lt!11 () Int)

(minimize (ite (>= lt!11 0) lt!11 (- lt!11)))
(declare-fun lt!10 () Int)

(minimize (ite (>= lt!10 0) lt!10 (- lt!10)))
(declare-fun b!32 () Bool)

(assert (=> b!32 (= e!17 (+ 1 (ite (>= lt!11 lt!10) lt!11 lt!10)))))

(minimize (ite (>= lt!10 0) lt!10 (- lt!10)))
(assert (=> b!32 (= lt!10 (height!0 (right!3 (right!3 (right!3 aTree!0)))))))

(minimize (ite (>= lt!11 0) lt!11 (- lt!11)))
(assert (=> b!32 (= lt!11 (height!0 (left!3 (right!3 (right!3 aTree!0)))))))

(assert (= (and d!25 c!14) b!31))

(assert (= (and d!25 (not c!14)) b!32))

(declare-fun m!49 () Bool)

(assert (=> b!32 m!49))

(declare-fun m!51 () Bool)

(assert (=> b!32 m!51))

(assert (=> b!20 d!25))

(declare-fun d!27 () Bool)

(declare-fun c!15 () Bool)

(assert (=> d!27 (= c!15 ((_ is Empty!1) (left!3 (right!3 aTree!0))))))

(declare-fun e!18 () Int)

(minimize (ite (>= e!18 0) e!18 (- e!18)))
(assert (=> d!27 (= (height!0 (left!3 (right!3 aTree!0))) e!18)))

(minimize (ite (>= e!18 0) e!18 (- e!18)))
(declare-fun b!33 () Bool)

(assert (=> b!33 (= e!18 0)))

(minimize (ite (>= e!18 0) e!18 (- e!18)))
(declare-fun lt!13 () Int)

(minimize (ite (>= lt!13 0) lt!13 (- lt!13)))
(declare-fun lt!12 () Int)

(minimize (ite (>= lt!12 0) lt!12 (- lt!12)))
(declare-fun b!34 () Bool)

(assert (=> b!34 (= e!18 (+ 1 (ite (>= lt!13 lt!12) lt!13 lt!12)))))

(minimize (ite (>= lt!12 0) lt!12 (- lt!12)))
(assert (=> b!34 (= lt!12 (height!0 (right!3 (left!3 (right!3 aTree!0)))))))

(minimize (ite (>= lt!13 0) lt!13 (- lt!13)))
(assert (=> b!34 (= lt!13 (height!0 (left!3 (left!3 (right!3 aTree!0)))))))

(assert (= (and d!27 c!15) b!33))

(assert (= (and d!27 (not c!15)) b!34))

(declare-fun m!53 () Bool)

(assert (=> b!34 m!53))

(declare-fun m!55 () Bool)

(assert (=> b!34 m!55))

(assert (=> b!20 d!27))

(declare-fun d!29 () Bool)

(declare-fun c!16 () Bool)

(assert (=> d!29 (= c!16 ((_ is Empty!1) (right!3 (left!3 aTree!0))))))

(declare-fun e!19 () Int)

(minimize (ite (>= e!19 0) e!19 (- e!19)))
(assert (=> d!29 (= (height!0 (right!3 (left!3 aTree!0))) e!19)))

(minimize (ite (>= e!19 0) e!19 (- e!19)))
(declare-fun b!35 () Bool)

(assert (=> b!35 (= e!19 0)))

(minimize (ite (>= e!19 0) e!19 (- e!19)))
(declare-fun lt!15 () Int)

(minimize (ite (>= lt!15 0) lt!15 (- lt!15)))
(declare-fun lt!14 () Int)

(minimize (ite (>= lt!14 0) lt!14 (- lt!14)))
(declare-fun b!36 () Bool)

(assert (=> b!36 (= e!19 (+ 1 (ite (>= lt!15 lt!14) lt!15 lt!14)))))

(minimize (ite (>= lt!14 0) lt!14 (- lt!14)))
(assert (=> b!36 (= lt!14 (height!0 (right!3 (right!3 (left!3 aTree!0)))))))

(minimize (ite (>= lt!15 0) lt!15 (- lt!15)))
(assert (=> b!36 (= lt!15 (height!0 (left!3 (right!3 (left!3 aTree!0)))))))

(assert (= (and d!29 c!16) b!35))

(assert (= (and d!29 (not c!16)) b!36))

(declare-fun m!57 () Bool)

(assert (=> b!36 m!57))

(declare-fun m!59 () Bool)

(assert (=> b!36 m!59))

(assert (=> b!22 d!29))

(declare-fun d!31 () Bool)

(declare-fun c!17 () Bool)

(assert (=> d!31 (= c!17 ((_ is Empty!1) (left!3 (left!3 aTree!0))))))

(declare-fun e!20 () Int)

(minimize (ite (>= e!20 0) e!20 (- e!20)))
(assert (=> d!31 (= (height!0 (left!3 (left!3 aTree!0))) e!20)))

(minimize (ite (>= e!20 0) e!20 (- e!20)))
(declare-fun b!37 () Bool)

(assert (=> b!37 (= e!20 0)))

(minimize (ite (>= e!20 0) e!20 (- e!20)))
(declare-fun lt!17 () Int)

(minimize (ite (>= lt!17 0) lt!17 (- lt!17)))
(declare-fun lt!16 () Int)

(minimize (ite (>= lt!16 0) lt!16 (- lt!16)))
(declare-fun b!38 () Bool)

(assert (=> b!38 (= e!20 (+ 1 (ite (>= lt!17 lt!16) lt!17 lt!16)))))

(minimize (ite (>= lt!16 0) lt!16 (- lt!16)))
(assert (=> b!38 (= lt!16 (height!0 (right!3 (left!3 (left!3 aTree!0)))))))

(minimize (ite (>= lt!17 0) lt!17 (- lt!17)))
(assert (=> b!38 (= lt!17 (height!0 (left!3 (left!3 (left!3 aTree!0)))))))

(assert (= (and d!31 c!17) b!37))

(assert (= (and d!31 (not c!17)) b!38))

(declare-fun m!61 () Bool)

(assert (=> b!38 m!61))

(declare-fun m!63 () Bool)

(assert (=> b!38 m!63))

(assert (=> b!22 d!31))

(check-sat (not b!32) (not b!36) (not b!34) (not b!24) (not b!28) (not b!26) (not b!30) (not b!38))
(get-model)

