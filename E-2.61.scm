#lang sicp
; SCIP e 2.61
; a set operation for sets as ordered lists

(define (adjoin-set x set)
   (cond ((null? set) (list x))
         ((< x (car set)) (cons x set))
         ((< (car set) x) (cons (car set) (adjoin-set x (cdr set))))
         (else set)))


(adjoin-set 0 (list 1 2 4))        ; (0 1 2 4)
(adjoin-set 1 (list 1 2 4))        ; (1 2 4)
(adjoin-set 2 (list 1 2 4))        ; (1 2 4)
(adjoin-set 3 (list 1 2 4))        ; (1 2 3 4)
(adjoin-set 4 (list 1 2 4))        ; (1 2 4)
(adjoin-set 10 (list 1 2 4))       ; (1 2 4 10)
(adjoin-set 4 (list 1 2 3 5 6))    ; (1 2 3 4 5 6)
(adjoin-set 4 (list 1 2 3 4 5 6))  ; (1 2 3 4 5 6)
