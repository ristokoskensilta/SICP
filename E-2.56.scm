#lang sicp
; derivation for expressions build by addition and multiplication

; p147
(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp)
            (if (same-variable? exp var) 1 0))
         ((sum? exp)
            (make-sum (deriv (addend exp) var)   ; the first term of the sum
                      (deriv (augend exp) var))) ; the second term
         ((product? exp)
            (make-sum
               (make-product (multiplier exp)
                             (deriv (multiplicand exp) var))
               (make-product (deriv (multiplier exp) var)
                             (multiplicand exp))))
         ((exponentiation? exp)
            (make-product 
               (make-product 
                  (exponent exp)
                  (make-exponentiation
                     (base exp)
                     (- (exponent exp) 1))) ; presupposes that exponent is a number
               (deriv (base exp) var)))
         (else 
            (error "unkown expression type -- DERIV" exp))))

; p148

; VARIABLE
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
   (and (variable? v1) (variable? v2) (eq? v1 v2)))


; SUM
(define (sum? x)
   (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (make-sum a1 a2)
   (cond ((=number? a1 0) a2)
         ((=number? a2 0) a1)
         ((and (number? a1) (number? a2)) (+ a1 a2))
         (else (list '+ a1 a2))))


; PRODUCT
(define (product? x)
   (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (make-product m1 m2)
   (cond ((or (=number? m1 0) (=number? m2 0)) 0)
         ((=number? m1 1) m2)
         ((=number? m2 1) m1)
         ((and (number? m1) (number? m2)) (* m1 m2))
         (else (list '* m1 m2))))


; EXPONENT
(define (exponentiation? x)
   (and (pair? x) (eq? (car x) '**)))

(define (base p) (cadr p))

(define (exponent p) (caddr p))

(define (make-exponentiation base exp)
   (cond ((=number? exp 0) 0)
         ((=number? exp 1) base)
         ((and (number? base) (number? exp)) (expt base exp))
         (else (list '** base exp))))


; a helper, p150
(define (=number? exp num)
  (and (number? exp) (= exp num)))


; test p149
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(+ (+ (* 2 (** x 3)) (** x 2)) (* 3 x)) 'x)
(make-exponentiation 'x 1)
(make-exponentiation 'x 0)
(make-exponentiation 'x 4)
