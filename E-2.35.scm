#lang sicp
; SCIP e 2.35: count-leafs defined by accumulation operation

(define (enumerate-leaves tree) 
   (cond ((null? tree) nil)
         ((not (pair? tree)) (list tree))
         (else (append (enumerate-leaves (car tree)
                       (enumerate-leaves (cdr tree)))))))

(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

; without map
(define (count-leaves2 t)
   (accumulate (lambda (x y) (+ 1 y)) 
               0 
               (map enumerate-leaves t)))

; with map
(define (count-leaves t)
   (accumulate + 
               0 
               (map (lambda (node)
                        (if (pair? node)
                            (count-leaves node)
                            1))
                    t)))


;(count-leaves2 (list (list 1 2) (list 3 4)))
(count-leaves (list (list 1 2) (list 3 4)))

