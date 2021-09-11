#lang sicp
; SICP: Excercise 2.7

(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))

(define (lower-bound i) (car i))

(define (print-i i) 
   (display "[")
   (display (lower-bound i))
   (display ",")
   (display (upper-bound i))
   (display "]")
   (newline))


; from p96 e2.13
(define one (make-interval 1 1))

; Formula for a parallel equavalent resistance R_p (or what ever) (p93)
(define (parallel-resistance i j)
   (let ((repic1 (div-interval one i))
         (recip2 (div-interval one j)))
    (div-interval one (add-interval repic1 recip2))))

; from the text
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval x y)
   (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

; a test from the text of the book
(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval 4.465 4.935))

(print-i r1)
(print-i r2)

(define rp (parallel-resistance r1 r2))

(print-i rp)
