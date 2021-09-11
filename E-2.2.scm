; defining points and line segments in a plane

; auxiliary operations
(define (average x y) (/ (+ x y) 2))

; segment
(define (make-segment a b) (cons a b))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (midpoint-segment s) 
   (let (
         (x-start (x-point (start-segment s)))
         (y-start (y-point (start-segment s)))
         (x-end (x-point (end-segment s)))
         (y-end (y-point (end-segment s)))
        )
      (make-point (average x-start x-end) 
                  (average y-start y-end))
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

(define start (make-point 0 1))
(define end (make-point 2 3))
(print-point start)
(print-point end)

(define segment (make-segment start end))

(define midpoint (midpoint-segment segment))

(print-point midpoint)