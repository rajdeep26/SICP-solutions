(define (expt-iter b n a)
  (cond 
    ((= n 0) a)
    ((even? n) (expt-iter (square b) (/ n 2) a))
    (else (expt-iter b (- n 1) (* a b) ))))

(define (myexpt b n)
  (expt-iter b n 1))


(myexpt 2 1000)