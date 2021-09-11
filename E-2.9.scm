#lang sicp
; SICP: Excercise 2.9: width

; Width of an interval i given by adding two intervals, a b, is function of the
; widths of those intervals. 
; PROOF: Width of i, w_i, is 
;
;   (/ (- (upper-bound i) (lower-bound i)) 2)
;
; and (upper-bound i) is
;
;   (+ (- (center a) (width a)) (- (center b) (width b)))
;
; the (lower-bound i) is
;
;   (+ (+ (center a) (width a)) (+ (center b) (width b)))
;
; On the other hand, width of an interval i fiven by multiplying two intervals, 
; a b, is not function of the widths of those intervals. 
; PROOF: Let
; 
;   A = [0, 1]
;   B = [1, 2]
;   C = [2, 3]
;
; Now w_A = w_B = w_C = 0.5, and
;   
;   A mul B = [min(0, 0, 1, 2), max(0, 0, 1, 2)]
;           = [0, 2]
;
; with
;
;   w_(A mul B) = 1.
;
; But 
;
;  A mul C = [min(0, 0, 2, 3), max(0, 0, 2, 3)]
;          = [0, 3]
;
; with 
;
;   w_(A mul C) = 1.5.

(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))

(define (lower-bound i) (car i))

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
   (make-interval (- (lower-bound x) (upper-bound y))
                  (- (upper-bound x) (lower-bound y))))

; from the text
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

; from the text
(define (div-interval x y)
   (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

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


