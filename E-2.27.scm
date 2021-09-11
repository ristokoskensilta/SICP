#lang sicp
; e SCIP 2.27: deep-reverse list

(define (deep-reverse items)
   (if (not (pair? items))
       items
       (append (deep-reverse (cdr items))
               (list (deep-reverse (car items))))))

(define A (list (list 1 2 (list 7)) (list (list 3 (list 8 (list 9 10)) 4 ))))
A
; ((1 2 (7)) ((3 (8 (9 10)) 4)))
(deep-reverse A)
; (((4 ((10 9) 8) 3)) ((7) 2 1))
(deep-reverse (list 1))
(deep-reverse (list nil))
(deep-reverse nil)