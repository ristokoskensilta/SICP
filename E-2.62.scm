#lang sicp
; SCIP e 2.62
; a O(n) union operation for sets as ordered lists

(define (union-set s1 s2)
   (cond ((null? s1) s2)
         ((null? s2) s1)
         ((let ((x1 (car s1)) (x2 (car s2)))
            (cond ((= x1 x2)
                     (cons x1 (union-set (cdr s1) (cdr s2))))
                  ((< x1 x2)
                     (cons x1 (union-set (cdr s1) s2)))
                  (else
                     (cons x2 (union-set s1 (cdr s2)))))))))



; test
(union-set (list 1 2 3 4 7) (list 1 3 4 5 6))
