#lang sicp
; SCIP excercies 2.58
;converter test
(define (convertToPrefix exp)
  (cond ((not (pair? exp)) exp)
        (else (list (convertToPrefix (cadr exp))
                    (convertToPrefix (car exp))
                    (convertToPrefix (caddr exp))))))

(convertToPrefix '(1 + 2))               ; (+ 1 2)
(convertToPrefix '((x * y) * (x + 3)))   ; (* (* x y) (+ x 3))

;a)
