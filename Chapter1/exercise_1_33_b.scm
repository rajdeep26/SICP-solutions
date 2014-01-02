(define (filtered-accumulate combiner null-value term a next b filter)
  (if 
    (> a b)
    null-value
    (if 
      (filter a)
      (combiner (term a) 
        (filtered-accumulate combiner null-value term (next a) next b filter))
      (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (product-using-filtered-accumulate term a next b filter)
  (filtered-accumulate * 1.0 term a next b filter))

(define (identity a)
  a)

(define (inc n)
  (+ n 1))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relatively-prime-nos n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (product-using-filtered-accumulate identity 1 inc n relatively-prime?))

(product-of-relatively-prime-nos 5)
