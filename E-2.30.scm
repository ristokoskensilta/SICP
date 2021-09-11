#lang sicp
; SCIP e 2.30: square tree operation, 
; direct/map implementations 

(define (square x) (* x x))

; implementation i: direct
(define (square-tree tree)
   (cond ((null? tree)
          nil)
         ((not (pair? tree)) 
          (square tree))
         (else (cons (square-tree (car tree))
                     (square-tree (cdr tree))))))

; implementation ii: map
(define (square-tree2 tree)
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
               (square-tree2 sub-tree)
               (square sub-tree)))   
        tree))

; test
(square-tree (list 1 
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(square-tree2 (list 1 
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
