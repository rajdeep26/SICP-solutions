(define (pascal-triangle-element n k)
  (if 
    (or (= k 0) (= n k))
      1
      (+ (pascal-triangle (- n 1) (- k 1)) 
      (pascal-triangle (- n 1) k))))

(pascal-triangle-element 6 3 )