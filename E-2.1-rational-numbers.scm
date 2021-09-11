#lang sicp
; defining rational numbers
(define (abs x) (if (> x 0) x (- x)))

(define (make-rat n d) 
   (cond ((= n 0)
            (cons n (abs d)))
         ((< (* n d) 0)
            (cons (- (abs n)) (abs d)))
         (else
            (cons (abs n) (abs d)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
   (make-rat (+ (* (numer x) (denom y))
                (* (numer y) (denom x)))
             (* (denom x) (denom y))))

(define (sub-rat x y)
   (make-rat (- (* (numer x) (denom y))
                (* (numer y) (denom x)))
             (* (denom x) (denom y))))

(define (mul-rat x y)
   (make-rat (* (numer x) (numer y))
             (* (denom x) (denom y))))

(define (div-rat x y)
   (make-rat (* (numer x) (denom y))
             (* (denom x) (numer y))))

(define (equal-rat x y)
   (= (* (numer x) (denom y))
      (* (numer y) denom x)))

(define (print-rat x)
   (newline)
   (display (numer x))
   (display "/")
   (display (denom x)))

(define one-half (make-rat 1 2))

(print-rat one-half)

(define one-third (make-rat 1 3))

(print-rat one-third)

(define neg-pos (make-rat -1 2))

(print-rat neg-pos)

(define pos-neg (make-rat 1 -2))

(print-rat pos-neg)

(define neg-neg (make-rat -1 -2))

(print-rat neg-neg)

(define zero-neg (make-rat 0 -2))

(print-rat zero-neg)

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))

