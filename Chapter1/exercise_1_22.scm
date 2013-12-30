(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
    false))

(define (report-prime n elapsed-time)
  (newline )
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
(find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
(= (remainder b a) 0))

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

(search-first-3-primes-from 100000000000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            First 3 Prime Numbers From        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;From 1000
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.

;;From 10000
;10007 *** 0.
;10009 *** 0.
;10037 *** 0.

;;From 100000
;100003 *** 1.0000000000000009e-2
;100019 *** 0.
;100043 *** 0.

;;From 1000000
;1000003 *** 1.0000000000000009e-2
;1000033 *** 0.
;1000037 *** 1.0000000000000009e-2

;;From 10000000
;10000019 *** 1.0000000000000009e-2
;10000079 *** 0.
;10000103 *** 1.0000000000000009e-2

;;From 100000000
;100000007 *** 1.9999999999999962e-2
;100000037 *** 1.0000000000000009e-2
;100000039 *** 2.0000000000000018e-2

;;From 1000000000
;1000000007 *** 5.0000000000000044e-2
;1000000009 *** .05999999999999994
;1000000021 *** .06000000000000005

;;From 10000000000
;10000000019 *** .17000000000000004
;10000000033 *** .17000000000000004
;10000000061 *** .16999999999999993

;;From 100000000000
;100000000003 *** .54
;100000000019 *** .5399999999999998
;100000000057 *** .54


;As can be seen form the timings that the order of growth is indeed O[root(n)]