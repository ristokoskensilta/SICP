#lang sicp
; e SCIP 2.20: arbitrary number of arguments 
; and same-parity operaton

(define (same-parity n . integers)
   (define (parity-list items)
      (define (parity? x y)
         (= (remainder x 2) (remainder y 2)))
      (cond
         ((null? items)
            nil)
         ((parity? n (car items))
            (cons (car items) (parity-list (cdr items))))
         (else 
            (parity-list (cdr items)))))
   (cons n (parity-list integers)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)