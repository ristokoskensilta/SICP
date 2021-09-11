#lang sicp
; SCIP e 2.28
; fridge operation that lists the leaves 
; of a tree

(define (fridge items)
   (cond ((null? items)
            items)
         ((not (pair? items))
            (list items))
         (else
             (append (fridge (car items))
                     (fridge (cdr items))))))

;test
(define A (list (list 1 2) (list 3 4)))
A
(fridge A)
(fridge (list A A))

