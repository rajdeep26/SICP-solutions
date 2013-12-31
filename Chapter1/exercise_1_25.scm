(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime n (- (runtime) start-time))
    false))

(define (report-prime n elapsed-time)
  (newline )
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (fast-expt b n)
  (cond 
    ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

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

(search-first-3-primes-from 10000)

;===========Results=============;
;
;Using fast-expt procedure, degrades the performance as can be seen from the results below.

;1009 *** 0.
;1013 *** 0.
;1019 *** 0.

;10007 *** .07
;10009 *** .06999999999999999
;10037 *** .07

;100003 *** 10.44
;100019 *** 10.190000000000001
;100043 *** 11.719999999999999