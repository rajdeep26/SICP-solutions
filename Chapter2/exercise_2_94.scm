(define (remainder-terms a b)
  (cdr (div-poly a b)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (gcd-poly a b)
  (if (same-variable? (variable a) (variable b))
      (make-polynomial (variable a)
                       (gcd-terms a b))
      (error "Variables are not the same -- GCD-POLY")))