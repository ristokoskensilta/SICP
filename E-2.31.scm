#lang sicp
; SCIP e 2.31: abstracting tree mapping procedure

(define (square x) (* x x))

; extending map to tree structures
(define (tree-map proc tree)
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
               (tree-map proc sub-tree)
               (proc sub-tree)))   
        tree))

(define (square-tree tree) (tree-map square tree))

; less abstract implementation (e 2.30)
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
