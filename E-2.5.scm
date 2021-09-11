; Church numbers

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) 
   (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add n m) 
   (lambda (f) (lambda (x) ((n f) ((m f) x)))))

(define (inc n) (+ n 1))
 (define (print-church n) 
   (display ((n inc) 0)) (newline))

(print-church zero)
(print-church one)
(print-church two)
(print-church (add two two))

; alternative implementation
(define (compose f g) (lambda (x) (f (g x)))) 

(define (add-church m n) 
   (lambda (f) (compose (m f) (n f))))

(print-church (add-church two two))


; testing 0 add-1
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f (x))))

; testing 1 add-1
; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f (x)))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f (x))) x))))
; (lambda (f) (lambda (x) (f (f (x)))))

