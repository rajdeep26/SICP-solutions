(define (sum-of-squares a b) 
  (+ (square a) (square b)))

(define (sum-of-squares-of-largest-two-numbers a b c)
	(cond 
    ((and (<= a c) (<= a b))
      (sum-of-squares b c))
    ((and (<= b a) (<= b c)) 
      (sum-of-squares a c))
    ((and (<= c a) (<= c b)) 
      (sum-of-squares a b))))

(sum-of-squares-of-largest-two-numbers 9 8 7)