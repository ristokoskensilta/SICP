#lang sicp
; SICP: Excercise 2.10: dividing by zero

(define (make-interval a b) (cons a b))

(define (upper-bound i) (max (car i) (cdr i)))

(define (lower-bound i) (min (car i) (cdr i)))

; alternative constructor
(define (make-center-width c e)
   (make-interval (-c w) + c w))

(define (width i) 
   (/ (- (upper-bound i) (lower-bound i)) 2))

(define (center i)
   (+ (lower-bound i) (width i)))

(define (print-i i) 
   (display "[")
   (display (lower-bound i))
   (display ",")
   (display (upper-bound i))
   (display "]")
   (newline))

; from p96 (e2.13)
(define one (make-interval 1 1))

; from the text
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
   (add-interval x (make-interval (- (lower-bound x) (upper-bound y))
                                  (- (upper-bound x) (lower-bound y))))

; Or more elegant version based on add-interval.
; (define (sub-interval x y)
;   (make-interval (- (upper-bound y))
;                  (- (lower-bound y))))

; from the text
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

; from the text and e2.10
(define (div-interval x y)
   (cond ((> (width y) 0)
            (mul-interval x
                          (make-interval (/ 1.0 (upper-bound y))
                                         (/ 1.0 (lower-bound y)))))
         (else (error "Cannot divide by an interval that spans 0!" y))))

; Formula for a parallel equavalent resistance R_p (or what ever) (p93)
(define (parallel-resistance i j)
   (let ((repic1 (div-interval one i))
         (recip2 (div-interval one j)))
    (div-interval one (add-interval repic1 recip2))))


; a test from the text of the book
(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval 4.465 4.935))

(print-i r1)
(print-i r2)
(display (width r1))
(newline)
(display (center r1))
(newline)
(display (width r2))
(newline)
(display (center r2))
(newline)


(print-i (add-interval r1 r2))
(print-i (add-interval r2 r1))
(print-i (sub-interval r1 r2))

; r2 < r1 (in some sense)
(print-i (sub-interval r2 r1))

(define rp (parallel-resistance r1 r2))

(print-i rp)

; Gives an error, because cannot divide by 0 ((width one) is 0).
; (div-interval r1 one)
