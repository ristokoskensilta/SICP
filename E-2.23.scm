#lang sicp
; e SCIP 2.23 implementing for-each operaton'

(define (for-each action items)
   (cond ((null? items))
          (else (action (car items)) (for-each action (cdr items)))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4))