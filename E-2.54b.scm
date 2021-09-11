#lang sicp
(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) true)
        ((or (null? l1) (null? l2)) false)
        ((and (symbol? (car l1)) (symbol? (car l2)))
              (cond ((eq? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))
                    (else false)))
        ((and (list? (car l1)) (list? (car l2)))
              (cond ((equal? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))
                    (else false)))
        (else false)))

(equal? (list 'b) (list 'a 'b))