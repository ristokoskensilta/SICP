#lang sicp
; SCIP e 2.33

(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

; a)
(define (map p sequence)
   (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

; b)
(define (append seq1 seq2) 
   (accumulate cons seq2 seq1))

; c)
(define (length sequence) 
   (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

; test

; a)
(define (square items) (map (lambda (x) (* x x)) items))
(square (list 1 2 3 4 5))

; b)
(append (list 1 2 3) (list 4 5 6))

; c)
(length (list 1 2 3 4 5))


