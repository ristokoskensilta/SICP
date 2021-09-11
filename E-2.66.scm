#lang sicp
; SCIP e 2.66
; "Implement a lookup proceduse for the case where the set of records is
; structured as a binary tree, ordered by the numerical values of the keys.

(define (lookup key record-tree)
  (cond ((null? record-tree) false)
        ((= key (get-key (entry record-tree)))
           (entry record-tree))
        ((< key (get-key (entry record-tree)))
           (lookup key (left record-tree)))
        (else
           (lookup key (right record-tree)))))

(define (get-key rec)
  (car rec))