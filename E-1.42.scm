; Operaton for composing one argument funtions
(define (compose f g)
   ((lambda (x) (f (g x)))))

((compose square inc) 6)
((lambda (x) (square (inc x))) 6)
(square (inc 6))
(squre 7)
49