; defining two implementations for PARALLELOGRAM in a plane
; it says "rectangle" in the code, but that's only because of 
; a miss-read instructions; implementing rectangles would be a 
; limiting case of a parallelogram

; auxiliary operations
;******************************
(define (print x) 
  (newline)
  (display x))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (abs n) (if (> n 0) n (- n)))

 (define (iterative-improve good-enough? improve) 
   (lambda (x) 
     (define (iter n) 
       (if (good-enough? n) 
           n 
           (iter (improve n)))) 
     (iter x))) 

(define s-tolerance 0.001)
(define (sqrt x)
   ((iterative-improve
      (lambda (y) (< (abs (- (square y) x)) s-tolerance))
      (lambda (y) (average y (/ x y))))
    0.1)) 

;***********************************

; segment
(define (make-segment a b) (cons a b))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))
(define (x-start s) (x-point (start-segment s)))
(define (y-start s) (y-point (start-segment s)))
(define (x-end s) (x-point (end-segment s)))
(define (y-end s) (y-point (end-segment s)))

(define (length-segment s)
   (let
      (
         (x-length (- (x-start s) (x-end s)))
         (y-length (- (y-start s) (y-end s)))
      )
      (sqrt (+ (square x-length) (square y-length)))
   )
)

(define (midpoint-segment s) 
   (let (
         (x-mid (average (x-start s) (x-end s)))
         (y-mid (average (y-start s) (y-end s)))
        )
      (make-point x-mid y-mid)
   )
)

; point
(define (make-point x y) (cons x y))
(define (x-point a) (car a))
(define (y-point a) (cdr a))

(define (print-point p)
   (newline)
   (display "(")
   (display (x-point p))
   (display ",")
   (display (y-point p))
   (display ")"))

; rectanle
(define (make-rectangle x y z) (cons x (cons y z)))
(define (angle-1 r) (car r))
(define (angle-2 r) (car (cdr r)))
(define (angle-3 r) (cdr (cdr r)))
(define (side-1 r) (make-segment (angle-1 r) (angle-2 r)))
(define (side-2 r) (make-segment (angle-1 r) (angle-3 r)))

; a different implementations
(define (make-rectangle-alt x y z) 
  (cons (make-segment x y) (make-segment x z)))
(define (angle-1-alt r) (start-segment (car r)))
(define (angle-2-alt r) (end-segment (car r)))
(define (angle-3-alt r) (end-segment (cdr r)))
(define (side-1-alt r) (car r))
(define (side-2-alt r) (cdr r))

(define (perimeter-rectangle r) 
   (let (
         (length-side-1 (length-segment (side-1 r)))
         (length-side-2 (length-segment (side-2 r)))
        )
      (+ (* 2 length-side-1) (* 2 length-side-2))
   )  
)

(define (area-rectangle r) 
   (let (
         (length-side-1 (length-segment (side-1 r)))
         (length-side-2 (length-segment (side-2 r)))
        )
      (* length-side-1 length-side-2)
   )  
)

(define start (make-point 0 (- 1)))
(define end (make-point (- 2) 3))
(print-point start)
(print-point end)

; implementation 1
(define segment (make-segment start end))

(define midpoint (midpoint-segment segment))

(print-point midpoint)

(define a (make-point 0 0))
(define b (make-point 0 2))
(define c (make-point 2 0))

(define rectangle (make-rectangle a b c))

(print-point (angle-1 rectangle))
(print-point (angle-2 rectangle))
(print-point (angle-3 rectangle))

(print (length-segment (side-1 rectangle)))
(print (length-segment (side-2 rectangle)))

(print (perimeter-rectangle rectangle))
(print (area-rectangle rectangle))

; implementation 2
(define rectangle2 (make-rectangle-alt a b c))

(print-point (angle-1-alt rectangle2))
(print-point (angle-2-alt rectangle2))
(print-point (angle-3-alt rectangle2))

(print (length-segment (side-1-alt rectangle2)))
(print (length-segment (side-2-alt rectangle2)))

