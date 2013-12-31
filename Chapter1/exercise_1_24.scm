(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime n (- (runtime) start-time))
    false))

(define (report-prime n elapsed-time)
  (newline )
  (display n)
  (display " *** ")
  (display elapsed-time))

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
  (define (try-it a)
  (= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
  (else false)))

(define (search-for-primes start count)
  (if 
    (even? start)
    (search-for-primes (+ start 1) count)
    (cond 
      ((< count 3) 
        ((if (start-prime-test start (runtime))
        (search-for-primes (+ start 2) (+ count 1))
        (search-for-primes (+ start 2) count)))))))

(define (search-first-3-primes-from n)
  (search-for-primes n 0))

(search-first-3-primes-from 100000000000000)

;When I applied Fermat's primality test to Exercise 1.22, the following
;results were obtained. 
;As can be seen from the result, at first the performance is the same
;as before, but as we increase the value of n, the performance 
;increases by 3 (approx.)times.

;;;First 3 prime numbers From

;From 1000
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.

;Ratio: 1

;From 10000
;10007 *** 0.
;10009 *** 1.0000000000000002e-2
;10037 *** 0.

;Ratio: 1

;From 100000
;100003 *** 0.
;100019 *** 0.
;100043 *** 1.0000000000000009e-2

;Ratio: 1

;From 1000000
;1000003 *** 9.999999999999995e-3
;1000033 *** 0.
;1000037 *** 0.

;Ratio: 1

;From 10000000
;10000019 *** 0.
;10000079 *** 1.0000000000000009e-2
;10000103 *** 0.

;Ratio: 1

;From 100000000
;100000007 *** 9.999999999999995e-3
;100000037 *** 0.
;100000039 *** 0.

;Ratio: 1.9999999999999964

;From 1000000000
;1000000007 *** 0.
;1000000009 *** 0.
;1000000021 *** 0.

;Ratio:  5.000000000000007

;From 10000000000
;10000000019 *** 0.
;10000000033 *** 9.999999999999981e-3
;10000000061 *** 0.

;Ratio: 17

;From 100000000000
;100000000003 *** 0.
;100000000019 *** 0.
;100000000057 *** 0.

;Ratio: 54

;From 1000000000000
;1000000000039 *** 0.
;1000000000061 *** 1.0000000000000009e-2
;1000000000063 *** 0.

;Ratio: 163.99999999999994

;From 10000000000000
;10000000000037 *** 1.0000000000000009e-2
;10000000000051 *** 0.
;10000000000099 *** 0.

;From 100000000000000
;100000000000031 *** 0.
;100000000000067 *** 0.
;100000000000097 *** 1.0000000000000009e-2