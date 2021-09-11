#lang sicp
; SCIP - e 2.29: binary modile

(define (make-mobile left right)
   (list left right))

; length is a number
; structure is eather a number (weight) or mobile
(define (make-branch length structure)
   (list length structure))

(define (left-branch mobile)
   (car mobile))

(define (right-branch mobile)
   (car (cdr mobile)))

(define (branch-length branch)
   (car branch))

(define (branch-structure branch)
   (car (cdr branch)))

(define (total-weight mobile)
   (cond ((null? mobile)
            0)
         ((not (pair? mobile))
            mobile )
         (else
            (+ (total-weight (branch-structure (left-branch mobile)))
               (total-weight (branch-structure (right-branch mobile)))))))

 (define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8)))))

m1
(total-weight m1)