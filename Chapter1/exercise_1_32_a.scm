(define (accumulate combiner null-value term a next b)
  (if 
    (> a b)
    null-value
    (combiner (term a) 
    (accumulate combiner null-value term (next a) next b))))

(define (sum-using-accumulate term a next b)
  (accumulate + 0 term a next b))

(define (product-using-accumulate term a next b)
  (accumulate * 1 term a next b)) 