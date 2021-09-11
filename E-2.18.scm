#lang sicp
; e SCIP 2.18: reverse list

; #1 implementation
(define (last-pair l)
   (if (null? (cdr l))
       (car l)
       (last-pair (cdr l))))

(define (get-first-n l n)
   (cond ((> n (length l))
            (error "The list is too short!"))
         ((= n 1)
            (list (car l)))
         (else 
            (cons (car l) (get-first-n (cdr l) (- n 1))))))

(define (reverse l)
  (if (null? (cdr l))
      (list (car l))
      (cons (last-pair l) 
         (reverse (get-first-n l (- (length l) 1))))))

; #2 implementation
(define (rev l)
   (if (null? (cdr l))
       l
       (append (rev (cdr l))
               (list (car l)))))

; test
(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

; test
(rev (list 1 4 9 16 25))
; (25 16 9 4 1)