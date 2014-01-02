(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
    (sum term (next a) next b))))

(define (cube n)
  (* n n n))

(define (simpson f a b n)

  (define h
    (/ (- b a) n))

  (define (y k)
    (f (+ a (* k h))))

  (define (term k)
    (cond 
      ((odd? k) (* 4 (y k)))
      ((or (= k 0) (= k n)) (y k))
      (else (* 2 (y k)))))

  (define (inc k)
    (+ k 1))

  (/ (* h (sum term 0 inc n)) 3))


(simpson cube 0 1 100.0)