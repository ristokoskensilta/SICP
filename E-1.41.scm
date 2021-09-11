; Expanding "double" operaton
(define (double f)
   (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((lambda (y) ((lambda (x) (double (double x)) ((lambda (z) (double (double z)) y))) inc) 5)
((((lambda (x) (double (double x)) ((lambda (z) (double (double z)) inc))) 5)
((((lambda (x) (double (double x)) (double (double inc)))) 5)
((((double (double (double (double inc)))) 5)
((((double (double (double (lambda (x) (inc (inc x)))))))) 5)
((((double (double (lambda (y) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) y))))))) 5)
((((double (double (lambda (y) ((lambda (x) (inc (inc x))) (inc (inc y))))))))) 5)
((((double (double (lambda (y) (inc (inc (inc (inc y)))))))))))) 5)
((((double (lambda (x) (lambda (y) (inc (inc (inc (inc y)))) (lambda (y) (inc (inc (inc (inc y)))) x))))))))) 5)
((((double (lambda (x) (lambda (y) (inc (inc (inc (inc y)))) (inc (inc (inc (inc x)))))))) 5)
((((double (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))))) 5)
(((lambda (z) (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc x)))))))) (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc x)))))))) z)))) 5)
(((lambda (z) (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc x)))))))) (inc (inc (inc (inc (inc (inc (inc (inc z))))))))))) 5)
(((lambda (z) (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc z)))))))))))))))))) 5)
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5)))))))))))))))))
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 6)))))))))))))))
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 7))))))))))))))
...
(inc 20)
21




((double (double inc)) 5)
((double (lambda (x) (inc (inc x)))) 5)
(((lambda (y) ((lambda (x) (inc (inc x))) ((lambda (x) (inc (inc x))) y)))) 5)
(((lambda (y) (inc (inc (inc (inc y)))))) 5)
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9