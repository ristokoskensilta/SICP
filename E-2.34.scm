#lang sicp
; SCIP e 2.34: Horner's evaluation defined by accumulation operation

(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
   (accumulate (lambda (this-coeff higher-terms) (+ this-coeff
                                                    (* x higher-terms)))
               0
               coefficient-sequence))

; test: x^4 + 3x^3 + 5x^2 + 7x + 9, where x = 2
(horner-eval 2 (list 9 7 5 3 1))
; test #2
(horner-eval 2 (list 1 3 0 5 0 1))

