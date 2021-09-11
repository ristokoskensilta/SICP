#lang sicp
; SCIP e 2.59
; union operation for sets

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

(define (element-of-set? x set)
   (cond ((null? set) false)
         ((equal? x (car set)) true)
         (else (element-of-set? x (cdr set)))))

; a clumsy version
(define (union-set2 s1 s2)
   (cond ((null? s1) s2)
         ((null? s2) s1)
         (else (if (element-of-set? (car s1) s2)
                   (cons (car s1) (union-set (cdr s1) (remove-element (car s1) s2)))
                   (cons (car s1) (union-set (cdr s1) s2))))))

(define (remove-element x set)
   (cond ((null? set) set)
         ((equal? x (car set)) (cdr set))
         (else (cons (car set) (remove-element x (cdr set))))))


; test
(union-set (list 1 5 6 7) (list 5 1 3 7 6 9))
(union-set2 (list 1 5 6 7) (list 5 1 3 7 6 9))
(union-set '() (list 5 1 3 7 6 9))
(union-set2 '() (list 5 1 3 7 6 9))