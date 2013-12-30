(define (mult-iter a b)
  (multiply a b 0))

(define (multiply a b n)
  (cond 
    ((= b 0) n)
    ((even? b) (multiply (double a) (halve b) n))
    (else (multiply a (- b 1) (+ a n)))))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(mult-iter 12 8)