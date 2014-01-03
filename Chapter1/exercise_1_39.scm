(define (cont-frac-iter n d k)
  (define (iter k results)
    (if 
      (= k 0)
      results
      (iter (- k 1) (/ (n k) (+ results (d k))))))
  (iter k 0.0))

(define pi 3.14)

(define (tan-cf x k)
  (define (n k)
    (if 
      (= k 1)
      x
      (- (square x))))
  (define (d k)
    (- (* 2 k) 1))
  (cont-frac-iter n d k))


   (tan-cf (/ pi 30) 10)