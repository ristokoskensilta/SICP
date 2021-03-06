#lang sicp
; e SCIP 2.21

; implementation i
(define (square-list1 items)
   (if (null? items)
      nil
      (cons (* (car items) (car items)) 
            (square-list1 (cdr items)))))

; implementation ii
(define (square-list2 items)
   (map (lambda (x) (* x x)) items))

; test
(square-list1 (list 1 2 3 4 5))
(square-list2 (list 1 2 3 4 5))