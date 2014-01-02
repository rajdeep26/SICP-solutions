(define (filtered-accumulate combiner null-value term a next b filter)
  (if 
    (> a b)
    null-value
    (if 
      (filter a)
      (combiner (term a) 
        (filtered-accumulate combiner null-value term (next a) next b filter))
      (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-using-filtered-accumulate term a next b filter)
  (filtered-accumulate + 0 term a next b filter))

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

(define (inc n)
  (+ n 1))

(define (sum-of-prime-nos n)
  (sum-using-filtered-accumulate square 1 inc n prime?))

(sum-of-prime-nos 5)