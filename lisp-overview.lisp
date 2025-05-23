;;;; Assignment that provides an overview of basic features
;;;; of the Common Lisp programming language.
;;;;
;;;; This code will be executed by running the following command from the console:
;;;; sbcl --script lisp-overview.lisp main
;;;; 
;;;; I recommend using VSCode or GitHub codespaces to work on this code, but you should make
;;;; sure that it behaves as expected when executed as described above. You should 
;;;; interact with the SBCL interpreter while developing your code. Details on running
;;;; unit tests are in the README.
;;;;
;;;; You are expected to complete all exercises according
;;;; to the specifications. Do not change the names or parameters
;;;; for any existing functions. You may add new functions, and              
;;;; will specifically be required to for some exercises. 
;;;; Absolutely all functions in this file must have complete
;;;; comments. Use three semi-colons for function header comments,
;;;; two semi-colons for in-function comments that are on their                   
;;;; own line, and one semi-colon for comments at the end of a line.
;;;; Some function stubs currently return a dummy result to allow
;;;; execution, but you will need to replace these with
;;;; proper return values. Whenever console output is required,                  
;;;; all formatting must match the specification exactly.
;;;;
;;;; author = Jacob Schrum, Last modified 6/12/2022
;;;; author = ADD YOUR NAME, ADD DATE

;;; A main function that runs all the exercises is defined at the bottom of this file.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Prints a dividing line between each exercise.
;;; exercise-number = Problem number printed in output
(defun print-divider (exercise-number)
    (progn
        ;; format is similar to Java's System.out.printf, but uses very different format codes
        (format t "--Exercise ~D----------------------------------" exercise-number)
        ;; terpri prints a carriage return to the console
        (terpri) ) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 1: Iterative Recursion
;;; 7 points functionality, 4 points documentation
;;; 
;;; Loops are typically not favored in functional programming languages.
;;; Common Lisp still has looping constructs, but you are not allowed to
;;; use them for this exercise. Although Lisp is not a "pure" functional language,
;;; you must write this function using pure functional style. That means you
;;; will need to define an additional recursive function, and you cannot 
;;; change the values of any variables.
;;;
;;; Define the function (limited-sum s e), which computes the sum of all 
;;; numbers between s and e inclusive that are divisible by 13. Call this
;;; function from the (exercise1) function so that it computes the sum of
;;; all numbers between 200 and 1287 inclusive that are divisible by 13. 
;;; Afterward, take the result of that function call and print it to the
;;; console. The format of your printed output should be a single line 
;;; with a carriage return, and look like the following:
;;; 
;;; The sum is: XXX
;;; 
;;; where XXX is the resulting sum.
(defun exercise1 ()
    ;; TODO: Write according to the specification above.
    nil)

;;; This function must recursively compute the sum of items divisible
;;; by 13 between s and e inclusive, as described in the comment above.
;;;
;;; TODO: params and return value
;;;
;;; DO NOT USE THE FOLLOWING: setf, setq, defvar, defparameter, or anything that
;;;                           sets/changes a variable. Also do not use any loops.
(defun limited-sum (s e) 
    ;; TODO: Write according to the specification above.
    nil)    ; TODO: Change return value

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 2: Strings
;;; 7 points functionality, 7 points documentation
;;; 
;;; Define a function called "first-longer-shorter" that takes
;;; two string parameters that each have at least one                        
;;; character. Generate an error using the "error" function if 
;;; this precondition is not satisfied. Your function should
;;; return a string consisting of exactly two characters:
;;; The first character of the longer string, followed
;;; by the first character of the shorter string.
;;; If both strings have equal length, then the first
;;; character of the first string parameter should come
;;; first in the result.
;;; 
;;; After defining your function, uncomment the test calls
;;; below which call your function. Note that your function
;;; must work for any valid input, not just for these
;;; examples.
;;;
;;; DO NOT USE THE FOLLOWING: setf, setq, defvar, defparameter, or anything that
;;;                           sets/changes a variable.
(defun exercise2 ()
    (progn
        ;; TODO: Uncomment the commented lines below to test your completed function.
        ;;       Turn in your code with these lines uncommented.
        ;(princ (first-longer-shorter "Hello" "Bye"))    ; princ prints a string to the console
        (terpri)                      
        ;(princ (first-longer-shorter "Bye" "Hello"))            
        (terpri)
        ;(princ (first-longer-shorter "1" "abc"))
        (terpri)
        ;(princ (first-longer-shorter "abc" "1"))
        (terpri)
        ;(princ (first-longer-shorter "abc" "123"))
        (terpri)
        ;(princ (first-longer-shorter "123" "abc")) 
        (terpri) ) ) 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 3: Lists
;;; 8 points functionality, 7 points documentation
;;; 
;;; Define a function called "move-to-end" that takes a list
;;; and an index within that list. Return a NEW list that has
;;; the same items in the same order, except that the item at 
;;; the designated index is now at the end of the list, and 
;;; items that previously came after it now appear one position
;;; to the left.
;;; 
;;; Test your method by completing the code below. This code should
;;; call move-to-end with a list containing 1, 2, ..., 10 in order, 
;;; and an index of 4. Afterward, print the contents of the returned
;;; list to the console on a single line with a carriage return at the 
;;; end, and a comma and space between each entry. The result should 
;;; look like the following:
;;; 
;;; 1, 2, 3, 4, 6, 7, 8, 9, 10, 5
;;;
;;; DO NOT USE THE FOLLOWING: setf, setq, defvar, defparameter, or anything that
;;;                           sets/changes a variable. Also do not use any loops.
(defun exercise3 ()
    ;; TODO: Call move-to-end as described above and print the result
    nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 4: More Recursion
;;; 10 points functionality, 7 points documentation
;;; 
;;; Define a sequence in the following way. The first three
;;; numbers are 1, 2, and 3. Every subsequent number is the sum of
;;; the previous number, and the number two entries before that
;;; one. So, the first few numbers in the sequence are:
;;; F(0) = 1
;;; F(1) = 2
;;; F(2) = 3
;;; F(3) = 1+3 = 4
;;; F(4) = 2+4 = 6
;;; 
;;; This sequence is similar to, but different from the Fibonacci
;;; sequence. You will write two methods defining this sequence.
;;; One uses pure recursion, the other uses dynamic programming.
;;; Note that your dynamic programming solution should not use                
;;; recursion at all. This is not a strict requirement of dynamic
;;; programming, but it is a requirement of this assignment.
;;; Use one of Lisp's loop constructs. In order to get the full
;;; efficiency benefits of dynamic programming, you will also
;;; need to use Lisp's array construct.
;;; 
;;; The function stubs for each approach are provided below. Once they
;;; are complete, you can uncomment the code in this function to test
;;; them. Note that these functions should generate an error
;;; for inappropriate inputs.
(defun exercise4 ()
    (progn
        ;; TODO: Uncomment the commented lines below to test your completed functions.
        ;;       Turn in your code with these lines uncommented.
        ;(format t "~D" (recursive-seq 5))
        (terpri)
        ;(format t "~D" (dynamic-seq 5))
        (terpri)
        ;(format t "~D" (recursive-seq 8))
        (terpri)
        ;(format t "~D" (dynamic-seq 8))
        (terpri)
        ;(format t "~D" (recursive-seq 15))
        (terpri)
        ;(format t "~D" (dynamic-seq 15)) 
        (terpri) ) )
	
;;; Recursively compute the sequence described in the comment for
;;; exercise 4.
;;; n = Position in the sequence
;;; return n-th value in the sequence
;;;
;;; DO NOT USE THE FOLLOWING: setf, setq, defvar, defparameter, or anything that
;;;                           sets/changes a variable. Also do not use any loops.
(defun recursive-seq (n)
    nil) ; TODO Change this

;;; Compute the sequence described in the comment for
;;; exercise 4 using dynamic programming. This will require
;;; the use of an auxiliary array (NOT a list). 
;;; n = Position in the sequence
;;; return n-th value in the sequence
;;;
;;; DO NOT USE RECURSION! You actually WILL need to set variable values.
(defun dynamic-seq (n)
    nil) ; TODO Change this
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 5: File I/O
;;; 10 points functionality, 8 points documentation
;;; 
;;; This method should read from the file "numbers.txt" which
;;; contains only integers, exactly one per line. The function should
;;; compute and print the maximum and average of the numbers in the file.
;;; The maximum should be formatted as an int, but the average should be
;;; a floating point average. The output will consist of exactly two lines, 
;;; each followed by a carriage return. Here is an example:
;;; 
;;; Maximum value: XXX
;;; Average value: XXX
;;; 
;;; where the XXX portions will be replaced with actual values calculated
;;; from the file. Note that you code must work for arbitrary input files,
;;; not just the provided example. However, you can assume the file is
;;; named "numbers.txt". If a file with this name does not exist, then
;;; do not crash. Instead, print the error message below followed by a carriage return:
;;; 
;;; The file "numbers.txt" does not exist. Exiting.
;;;  
;;; You may use Lisp's loop construct, or use recursion.
;;; You can also set/change the values of variables freely.
(defun exercise5 ()
    ;; TODO: Write according to the specification above.
    nil) ; TODO Change this

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Exercise 6: Structures
;;; 8 points functionality, 7 points documentation
;;; 
;;; Use defstruct to define a structure called "employee" with two members:
;;; - The amount that an employee is paid per hour.
;;; - The number of worked hours that the employee has not been paid for yet.
;;; The default number of hours worked should be 0, but the hourly pay
;;; must be defined on construction. Provide your defstruct command here:

;;; TODO: defstruct here

;;;You must also define several functions that use/access/modify your structure:

;;; - A function called "work" with an employee and an int parameter that 
;;;   increases the number of worked but unpaid hours by the int amount.
;;; TODO: params and return value
(defun work (e hours)
    ;; TODO: Write according to the specification above.
    nil) ; TODO Change this

;;; - A function "pay" that resets the unpaid worked hours of an employee 
;;;   to 0 and returns the amount the employee should be paid for the 
;;;   worked hours (multiply the rate by the hours).
;;; TODO: params and return value
(defun pay (e)
    ;; TODO: Write according to the specification above.
    nil) ; TODO Change this

;;; This function tests your data type and the functions above. Uncomment the lines
;;; below to test your implementation.
(defun exercise6 ()
    (progn
        ;; TODO: Uncomment the commented lines below to test your completed struct.
        ;;       Turn in your code with these lines uncommented.

        ;; setq assigns a value to a variable.
        ;; make-employee is automatically defined by creating a struct called "employee"
        ;(setq e1 (make-employee :hourly-rate 8.25))
        ;(work e1 8)
        ;(work e1 8)
        ;(work e1 8)
        ;(work e1 8)
        ;(work e1 8)
        ;(setq hours1 (employee-accumulated-hours e1))
        ;(setq paycheck1 (pay e1))
        ;; The ~$ format code corresponds to a floating point number with two values after the decimal.
        ;(format t "Employee 1 earns $~$ for ~D hours of work." paycheck1 hours1)
        (terpri)
        ;(work e1 10)
        ;(work e1 8)
        ;(work e1 8)
        ;(setq hours2 (employee-accumulated-hours e1))
        ;(setq paycheck2 (pay e1))
        ;(format t "Employee 1 earns $~$ for ~D hours of work." paycheck2 hours2)
        (terpri)
    
        ;(setq e2 (make-employee :hourly-rate 15.10))
        ;(work e2 8)
        ;(work e2 10)
        ;(work e2 10)
        ;(work e2 6)
        ;(work e2 6)
        ;(setq hours3 (employee-accumulated-hours e2))
        ;(setq paycheck3 (pay e2))
        ;(format t "Employee 2 earns $~$ for ~D hours of work." paycheck3 hours3)
        (terpri) ) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Launches code for all exercises. Do not change.
;;; This is placed after all function definitions to prevent
;;; certain style warnings. This runs when the script is launched
;;; from the command line, but only if "main" is supplied as a 
;;; command line parameter.
(defun main ()
    (progn                  ; progn is for running several commands in sequence
        (print-divider 1)
        (exercise1)
        (print-divider 2)
        (exercise2)
        (print-divider 3)
        (exercise3)
        (print-divider 4)
        (exercise4)
        (print-divider 5)
        (exercise5)
        (print-divider 6)
        (exercise6) ) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Actually call the main function after defining all functions.
;;; However, only call (main) if "main" is supplied as a command line
;;; parameter. This restriction prevents the unnecessary execution of
;;; the code when loading it into either the SBCL interpreter, or launching
;;; unit tests.
(if (and (ignore-errors sb-ext:*posix-argv*) (consp sb-ext:*posix-argv*) (equal (nth 1 sb-ext:*posix-argv*) "main")) (main))