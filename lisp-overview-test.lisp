;;; The following lines load QuickLisp so that parachute testing can be used.
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;;; Load parachute
(ql:quickload "parachute" :silent t)
(provide "parachute")
(in-package :parachute)
(load "lisp-overview.lisp")

(define-test exercise1-test
    (is string= (format nil "The sum is: 62790~%") 
                (with-output-to-string (*standard-output*) (exercise1)) ) )

(define-test limited-sum-test
    (is = 62790 (limited-sum 200 1287))
    (is = 260 (limited-sum 15 78))
    (is = 82485 (limited-sum 331 1503))
    (is = 0 (limited-sum 13 0))
    (is = 0 (limited-sum 13 12))
    (is = 13 (limited-sum 13 13))   )

(define-test exercise2-test
    (is string= (format nil "HB~%HB~%a1~%a1~%a1~%1a~%") 
                (with-output-to-string (*standard-output*) (exercise2)) ) )

(define-test first-longer-shorter-no-output
    (is string= "" 
                (with-output-to-string (*standard-output*) (first-longer-shorter "x x x x x x x x x x x x x x x x x x x x x x x x s x s sdasf dsfsdf sdf sdf sdfewfasf fsakkkasdfkwa o93 2" "sad")) ) )

(define-test first-longer-shorter-test
    (is string= "xs" (first-longer-shorter "x x x x x x x x x x x x x x x x x x x x x x x x s x s sdasf dsfsdf sdf sdf sdfewfasf fsakkkasdfkwa o93 2" "sad"))
    (is string= (format nil "~C~C" #\Newline #\tab) (first-longer-shorter (format nil "~Caddasdad ~C~C we" #\tab #\Newline #\Newline ) (format nil "~C ~C~C~C~C~C~Cx x x x x x x x x x x x x x x x x x x x x x x x s x s sdasf dsfsdf sdf sdf sdfewfasf fsakkkasdfkwa o93 2" #\Newline #\tab #\Newline #\Newline #\Newline #\tab #\tab)))  )

(define-test first-longer-shorter-errors
    (is string= "ERROR" (if (fboundp 'first-longer-shorter) 
                            (handler-case 
                                (first-longer-shorter "" "Test")
                                (error (c) "ERROR") )
                            "Does not exist") )
    (is string= "ERROR" (if (fboundp 'first-longer-shorter) 
                            (handler-case 
                                (first-longer-shorter "Test" "")
                                (error (c) "ERROR") )
                            "Does not exist") ) )

(define-test exercise3-test
    (is string= (format nil "1, 2, 3, 4, 6, 7, 8, 9, 10, 5~%") 
                (with-output-to-string (*standard-output*) (exercise3)) ) )

(define-test move-to-end-no-output
    (is string= "" 
                (with-output-to-string (*standard-output*) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 0)) ) )

(define-test move-to-end-test
    (is equal '(2 3 4 5 6 7 8 9 10 1) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 0))
    (is equal '(1 3 4 5 6 7 8 9 10 2) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 1))
    (is equal '(1 2 4 5 6 7 8 9 10 3) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 2))
    (is equal '(1 2 3 5 6 7 8 9 10 4) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 3))
    (is equal '(1 2 3 4 6 7 8 9 10 5) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 4))
    (is equal '(1 2 3 4 5 7 8 9 10 6) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 5))
    (is equal '(1 2 3 4 5 6 8 9 10 7) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 6))
    (is equal '(1 2 3 4 5 6 7 9 10 8) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 7))
    (is equal '(1 2 3 4 5 6 7 8 10 9) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 8))
    (is equal '(1 2 3 4 5 6 7 8 9 10) (move-to-end '(1 2 3 4 5 6 7 8 9 10) 9))
    (is equal '(-243 32 367845 10000) (move-to-end '(10000 -243 32 367845) 0))
    (is equal '(10000 32 367845 -243) (move-to-end '(10000 -243 32 367845) 1))
    (is equal '(10000 -243 367845 32) (move-to-end '(10000 -243 32 367845) 2))
    (is equal '(10000 -243 32 367845) (move-to-end '(10000 -243 32 367845) 3))  
    (is equal '(2 3 1 2 3 4 4 3 2 1) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 0))
    (is equal '(1 3 1 2 3 4 4 3 2 2) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 1))
    (is equal '(1 2 1 2 3 4 4 3 2 3) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 2))
    (is equal '(1 2 3 2 3 4 4 3 2 1) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 3))
    (is equal '(1 2 3 1 3 4 4 3 2 2) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 4))
    (is equal '(1 2 3 1 2 4 4 3 2 3) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 5))
    (is equal '(1 2 3 1 2 3 4 3 2 4) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 6))
    (is equal '(1 2 3 1 2 3 4 3 2 4) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 7))
    (is equal '(1 2 3 1 2 3 4 4 2 3) (move-to-end '(1 2 3 1 2 3 4 4 3 2) 8))  )

(define-test exercise4-test
    (is string= (format nil "9~%9~%28~%28~%406~%406~%") 
                (with-output-to-string (*standard-output*) (exercise4)) ) )

(define-test recursive-seq-errors
    (is string= "ERROR" (handler-case 
                            (recursive-seq -30)
                            (error (c) "ERROR") ))
    (is string= "ERROR" (handler-case 
                            (recursive-seq -5)
                            (error (c) "ERROR") ))
    (is string= "ERROR" (handler-case 
                            (recursive-seq -1)
                            (error (c) "ERROR") )) )

(define-test recursive-seq-test
    (is = 1 (recursive-seq 0))
    (is = 2 (recursive-seq 1))
    (is = 3 (recursive-seq 2))
    (is = 4 (recursive-seq 3))
    (is = 6 (recursive-seq 4))
    (is = 9 (recursive-seq 5))
    (is = 13 (recursive-seq 6))
    (is = 19 (recursive-seq 7))
    (is = 28 (recursive-seq 8))
    (is = 41 (recursive-seq 9))
    (is = 60 (recursive-seq 10))
    (is = 2745 (recursive-seq 20))
    (is = 125491 (recursive-seq 30))
    (is = 5736961 (recursive-seq 40)) )

(define-test dynamic-seq-errors
    (is string= "ERROR" (handler-case 
                            (dynamic-seq -30)
                            (error (c) "ERROR") ))
    (is string= "ERROR" (handler-case 
                            (dynamic-seq -5)
                            (error (c) "ERROR") ))
    (is string= "ERROR" (handler-case 
                            (dynamic-seq -1)
                            (error (c) "ERROR") )) )

(define-test dynamic-seq-test
    (is = 1 (dynamic-seq 0))
    (is = 2 (dynamic-seq 1))
    (is = 3 (dynamic-seq 2))
    (is = 4 (dynamic-seq 3))
    (is = 6 (dynamic-seq 4))
    (is = 9 (dynamic-seq 5))
    (is = 13 (dynamic-seq 6))
    (is = 19 (dynamic-seq 7))
    (is = 28 (dynamic-seq 8))
    (is = 41 (dynamic-seq 9))
    (is = 60 (dynamic-seq 10))
    (is = 88 (dynamic-seq 11))
    (is = 129 (dynamic-seq 12))
    (is = 189 (dynamic-seq 13))
    (is = 277 (dynamic-seq 14))
    (is = 406 (dynamic-seq 15))
    (is = 595 (dynamic-seq 16))
    (is = 872 (dynamic-seq 17))
    (is = 1278 (dynamic-seq 18))
    (is = 1873 (dynamic-seq 19))
    (is = 2745 (dynamic-seq 20))
    (is = 4023 (dynamic-seq 21))
    (is = 5896 (dynamic-seq 22))
    (is = 8641 (dynamic-seq 23))
    (is = 12664 (dynamic-seq 24))
    (is = 18560 (dynamic-seq 25))
    (is = 27201 (dynamic-seq 26))
    (is = 39865 (dynamic-seq 27))
    (is = 58425 (dynamic-seq 28))
    (is = 85626 (dynamic-seq 29))
    (is = 125491 (dynamic-seq 30))
    (is = 183916 (dynamic-seq 31))
    (is = 269542 (dynamic-seq 32))
    (is = 395033 (dynamic-seq 33))
    (is = 578949 (dynamic-seq 34))
    (is = 848491 (dynamic-seq 35))
    (is = 1243524 (dynamic-seq 36))
    (is = 1822473 (dynamic-seq 37))
    (is = 2670964 (dynamic-seq 38))
    (is = 3914488 (dynamic-seq 39))
    (is = 5736961 (dynamic-seq 40))
    (is = 8407925 (dynamic-seq 41))
    (is = 12322413 (dynamic-seq 42))
    (is = 18059374 (dynamic-seq 43))
    (is = 26467299 (dynamic-seq 44))
    (is = 38789712 (dynamic-seq 45))
    (is = 56849086 (dynamic-seq 46))
    (is = 83316385 (dynamic-seq 47))
    (is = 122106097 (dynamic-seq 48))
    (is = 178955183 (dynamic-seq 49))
    (is = 262271568 (dynamic-seq 50))
    (is = 384377665 (dynamic-seq 51))
    (is = 563332848 (dynamic-seq 52))
    (is = 825604416 (dynamic-seq 53))
    (is = 1209982081 (dynamic-seq 54))
    (is = 1773314929 (dynamic-seq 55))
    (is = 2598919345 (dynamic-seq 56))
    (is = 3808901426 (dynamic-seq 57))
    (is = 5582216355 (dynamic-seq 58))
    (is = 8181135700 (dynamic-seq 59))
    (is = 11990037126 (dynamic-seq 60))
    (is = 17572253481 (dynamic-seq 61))
    (is = 25753389181 (dynamic-seq 62))
    (is = 37743426307 (dynamic-seq 63))
    (is = 55315679788 (dynamic-seq 64))
    (is = 81069068969 (dynamic-seq 65))
    (is = 118812495276 (dynamic-seq 66))
    (is = 174128175064 (dynamic-seq 67))
    (is = 255197244033 (dynamic-seq 68))
    (is = 374009739309 (dynamic-seq 69))
    (is = 548137914373 (dynamic-seq 70))
    (is = 803335158406 (dynamic-seq 71))
    (is = 1177344897715 (dynamic-seq 72))
    (is = 1725482812088 (dynamic-seq 73))
    (is = 2528817970494 (dynamic-seq 74))
    (is = 3706162868209 (dynamic-seq 75))
    (is = 5431645680297 (dynamic-seq 76))
    (is = 7960463650791 (dynamic-seq 77))
    (is = 11666626519000 (dynamic-seq 78))
    (is = 17098272199297 (dynamic-seq 79))
    (is = 25058735850088 (dynamic-seq 80))
    (is = 36725362369088 (dynamic-seq 81))
    (is = 53823634568385 (dynamic-seq 82))
    (is = 78882370418473 (dynamic-seq 83))
    (is = 115607732787561 (dynamic-seq 84))
    (is = 169431367355946 (dynamic-seq 85))
    (is = 248313737774419 (dynamic-seq 86))
    (is = 363921470561980 (dynamic-seq 87))
    (is = 533352837917926 (dynamic-seq 88))
    (is = 781666575692345 (dynamic-seq 89))
    (is = 1145588046254325 (dynamic-seq 90))
    (is = 1678940884172251 (dynamic-seq 91))
    (is = 2460607459864596 (dynamic-seq 92))
    (is = 3606195506118921 (dynamic-seq 93))
    (is = 5285136390291172 (dynamic-seq 94))
    (is = 7745743850155768 (dynamic-seq 95))
    (is = 11351939356274689 (dynamic-seq 96))
    (is = 16637075746565861 (dynamic-seq 97))
    (is = 24382819596721629 (dynamic-seq 98))
    (is = 35734758952996318 (dynamic-seq 99)) )

(define-test exercise5-test
    (is string= (format nil "Maximum value: 201~%Average value: 8.688524~%") 
                (with-output-to-string (*standard-output*) (exercise5)) ) )

(defun swap-file-for-exercise5 ()
    (progn 
        (rename-file "numbers.txt" "numbers.cpy")
        (with-open-file 
            (str "numbers.txt"
                 :direction :output
                 :if-exists :supersede
                 :if-does-not-exist :create)
            (format str "-34~%-12312~%-200~%-3~%-145~%-57~%-9494~%-90909~%"))
        (ignore-errors (exercise5))
        (delete-file "numbers.txt")
        (rename-file "numbers.cpy" "numbers.txt")
    ) )

(define-test exercise5-different-file-test
    (is string= (format nil "Maximum value: -3~%Average value: -14144.25~%") 
                (with-output-to-string (*standard-output*) (swap-file-for-exercise5)) ) )

(defun remove-file-for-exercise5 ()
    (progn
        (rename-file "numbers.txt" "numbers.cpy")
        (ignore-errors (exercise5))
        (rename-file "numbers.cpy" "numbers.txt")
    ) )

(define-test exercise5-no-file-test
    (is string= (format nil "The file \"numbers.txt\" does not exist. Exiting.~%") 
                (with-output-to-string (*standard-output*) (remove-file-for-exercise5)) ) )
(define-test exercise6-test
    (is string= (format nil "Employee 1 earns $330.00 for 40 hours of work.~%Employee 1 earns $214.50 for 26 hours of work.~%Employee 2 earns $604.00 for 40 hours of work.~%") 
                (with-output-to-string (*standard-output*) (exercise6)) ) )

(test '(exercise1-test
        limited-sum-test 
        exercise2-test
        first-longer-shorter-no-output
        first-longer-shorter-test 
        first-longer-shorter-errors
        exercise3-test
        move-to-end-no-output
        move-to-end-test
        exercise4-test
        recursive-seq-test
        recursive-seq-errors
        dynamic-seq-test
        dynamic-seq-errors
        exercise5-test
        exercise5-different-file-test
        exercise5-no-file-test
        exercise6-test) )