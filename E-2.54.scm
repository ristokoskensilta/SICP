#lang sicp
; SCIP excercies 2.54
(define (equal? a b)
  (cond ((and (symbol? a) (symbol? b))
           (eq? a b))
        ((and (list? a) (list? b))
           (or (and (null? a) (null? b))
               (and (equal? (car a) (car b))
                    (equal? (cdr a) (cdr b)))))
        (else #f)))

(equal? 'this 'this)                          ; true
(equal? 'this 'is)                            ; false
(equal? '(this is a list) 'a)                 ; false
(equal? '(this is a list) '(this is a list))  ; true
(equal? '(this is a  list) '(this is a Lisp)) ; false