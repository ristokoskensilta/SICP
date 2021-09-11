; Pascal triangle

(define (Pascal row index)
   (if (or (= index 1) (= index row))
      1
      (+ (Pascal (- row 1) (- index 1))         
         (Pascal (- row 1) index))))
