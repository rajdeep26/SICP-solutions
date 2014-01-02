;;;General "Product" Procedure
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (term a)
  a)

(define (next a)
  (+ a 1))


;;Factorial using the general product procedure.
(define (factorial-using-product n)
  (product term 1 next n))


(factorial-using-product 10)

;Approximation to pi usinf John Wallis's formula.

(define (pi-approx n)

  (define (pi-term a)
    (if 
      (odd? a)
      (/ (+ a 1) a)
      (/ a (+ a 1))))

  (* 2 (product pi-term 1.0 next n)))

(pi-approx 1000)