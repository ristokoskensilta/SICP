; Recursive operaton
(define (f n)
   (if (< n 3) 
      n
      (+ (f (- n 1))(f (- n 2))(f (- n 3)))))

; Linear operation
(define (fib3 n)
  (if (< n 3) 
    n
    (fib3-iter 2 1 0 (- n 3))))

(define (fib3-iter f3 f2 f1 count)
  (if (= count 0)
    (+ f3 f2 f1)
    (fib3-iter (+ f3 f2 f1) f3 f2 (- count 1))))