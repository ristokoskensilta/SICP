#lang sicp
; SCIP e 2.62
; a more effective union operation for sets as ordered lists

(define (union-set s1 s2)
   (cond ((null? s1) s2)
         ((null? s2) s1)
         (else )))

(define (element-of-set? x set)
   (cond ((null? set) false)
         ((equal? x (car set)) true)
         (else (element-of-set? x (cdr set)))))

(define (remove-element x set)
   (cond ((null? set) set)
         ((equal? x (car set)) (cdr set))
         (else (cons (car set) (remove-element x (cdr set))))))

; test
(union-set (list 1 5 6 7) (list 5 1 3 7 6 9))