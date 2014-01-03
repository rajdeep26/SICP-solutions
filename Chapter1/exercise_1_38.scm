(define (cont-frac-iter n d k)
  (define (iter k results)
    (if 
      (= k 0)
      results
      (iter (- k 1) (/ (n k) (+ results (d k))))))
  (iter k 0.0))

(define (approx-e-minus-2 k)
  (cont-frac-iter 
    (lambda (x) 1.0)
    (lambda (x) 
      (if 
        (or (= (remainder x 3.0) 1) (= (remainder x 3.0) 0))
        1
        (* 2 (ceiling (/ x 3.0)))))
    k))

(approx-e-minus-2 4)