(define (fast-multiply a b)
  (cond 
    ((= b 1) a)
    ((even? b) 
      (double (fast-multiply a (halve b))))
    (else 
      (+ a 
        (double (fast-multiply a (halve (- b 1))))))))

(fast-multiply 1024 22)