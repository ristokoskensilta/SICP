#lang sicp
; e SCIP 2.22

(define (square x) (* x x))

; reverse square list
(define (square-list1 items)
   (define (iter things answer)
      (if (null? things)
         answer
         (iter (cdr things)
               (cons (square (car things))
                     answer))))
   (iter items nil))
; returns reversed list, because the value that is being manipulated
; is added in the beginning of the list


; implementation ii
(define (square-list2 items)
   (define (iter things answer)
      (if (null? things)
         answer
         (iter (cdr things)
               (cons answer
                     (square (car things))))))
   (iter items nil))


; this wont work, bacause iter iter operaton is now creating
; list in wrong direction and nesting pairs into the first pair

(square-list1 (list 1 2 3 4 5))
(square-list2 (list 1 2 3 4 5))