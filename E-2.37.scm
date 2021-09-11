#lang sicp
; SCIP e 2.37: linear algebra operations

(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
   (if (null? (car seqs))
       nil
       (cons (accumulate op init (map car seqs))
             (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
   (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
   (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
   (accumulate-n cons nil mat))

;;;;;;;;***************
(define (matrix-*-matrix m n)
   (let ((cols (transpose n)))
      (map (lambda (x) (+ ())) m)))

; test
(define mat1 (list (list 1 -1 2) (list 0 -3 1)))
(define vec1 (list 2 1 0))
(matrix-*-vector mat1 vec1)

(define mat2 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(transpose mat2)