; defining pairs as prosedures
(define (cons x y)
   (lambda (m) (m x y)))

(define (car z)
   (z (lambda (p q) p)))

(define (car z)
   (z (lambda (p q) q)))

; showing workings
(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

(cdr (cons x y))
(cdr (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) q))
((lambda (p q) q) x y)
y