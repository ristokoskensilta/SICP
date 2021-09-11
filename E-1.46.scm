; Procedure for improving approximations with iterative guessing

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

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

; Lets say tolerance for square root approximation should be 0.001
(define s-tolerance 0.001)

(define (sqrt x)
   ((iterative-improve
      (lambda (y) (< (abs (- (square y) x)) s-tolerance))
      (lambda (y) (average y (/ x y))))
    0.1)) 

; For good enough for fixed point operation
(define (close-enough? v1 v2) 
    (< (abs (- v1 v2) 0.00001))

(define (fixed-point f initial-guess)
   ((iterative-improve
      (lambda (x) (close-enough? x (f x)))
      f)
    initial-guess)) 

