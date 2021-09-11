#lang sicp
; SCIP e 2.32: power set by mapping

(define (subsets s)
   (if (null? s)
       (list nil)
       (let ((rest (subsets (cdr s))))
         (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; test
(subsets (list 1 2 3))

