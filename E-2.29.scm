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

; to make things a bit easier
(define (sub-mobile-left mobile)
   (branch-structure (left-branch mobile)))

(define (sub-mobile-right mobile)
   (branch-structure (right-branch mobile)))


(define (total-weight mobile)
   (cond ((null? mobile)
            0)
         ((not (pair? mobile))
            mobile )
         (else
            (+ (total-weight (sub-mobile-left mobile))
               (total-weight (sub-mobile-right mobile))))))


(define (torque branch) 
   (* (branch-length branch) (total-weight (branch-structure branch)))) 

(define (balanced? mobile)
  (define (sub-balanced? mobile)
     (= (torque (left-branch mobile))
        (torque (right-branch mobile))))
  (if (not (pair? mobile))
      #t
      (and (sub-balanced? mobile)
           (balanced? (sub-mobile-right mobile))
           (balanced? (sub-mobile-left mobile)))))




; test 
 (define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8)))))



m1
(total-weight m1)
(balanced? m1)
(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
 (total-weight a)
(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))
d
(balanced? d)