(define (expmod base exp m)
  (cond 
    ((= exp 0) 1)
    ((even? exp)
      (remainder (square (expmod base (/ exp 2) m))
      m))
    (else
      (remainder (* base (expmod base (- exp 1) m))
      m))))

(define (fermat-test n)
(try-it 1 n))

(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
  (else false)))

(define (try-it a n)
  (cond 
    ((>= a n) true)
    ((= (expmod a n n) a) (try-it (+ a 1) n))
    (else false)))

(fast-prime? 1105 10)