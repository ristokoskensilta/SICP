#lang sicp
; SICP: Excercise 2.14: two formulas for parallel resistors

(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))

(define (lower-bound i) (car i))

; alternative constructor 1
(define (make-center-width c w)
   (make-interval (- c w) (+ c w)))

; alternative constructor 2
(define (make-center-percentage c p)
   (let ((p-tolerance (* c p)))
      (make-interval (- c p-tolerance) (+ c p-tolerance))))

(define (percent i)
   (/ (width i) (center i)))

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

(define (print-i-p i) 
   (display "[")
   (display (center i))
   (display ",")
   (display (percent i))
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

; from the text and e2.10
(define (div-interval x y)
   (cond ((> (width y) 0)
            (mul-interval x
                          (make-interval (/ 1.0 (upper-bound y))
                                         (/ 1.0 (lower-bound y)))))
         (else (error "Cannot divide by an interval that spans 0!"))))

; Formula 1 for a parallel equavalent resistance R_p (or what ever) (p93/96)
(define (par1 i j)
    (div-interval (mul-interval i j)
                  (add-interval i j)))

; Formula 2 for a parallel equavalent resistance R_p (p96)
(define (par2 i j)
   (let ((repic1 (div-interval one i))
         (recip2 (div-interval one j)))
    (div-interval one (add-interval repic1 recip2))))


; a test from the text of the book
(define A (make-center-percentage 2 0.3))
(define B (make-center-percentage 3 0.3))
(define C (make-center-percentage 2 0.1))

(print-i A)
(print-i B)
(print-i C)

(print-i-p (div-interval A A))
(print-i-p (div-interval A B))