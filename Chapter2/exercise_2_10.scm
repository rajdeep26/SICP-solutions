(define (mul-interval x y)
  (let 
    ((p1 (* (lower-bound x) (lower-bound y)))
    (p2 (* (lower-bound x) (upper-bound y)))
    (p3 (* (upper-bound x) (lower-bound y)))
    (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval 
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if 
    (spans-zero? y)
    (error "Error: Divide by Zero.")
    (mul-interval x
      (make-interval 
        (/ 1.0 (upper-bound y))
        (/ 1.0 (lower-bound y))))))

(define (make-interval a b) 
  (cons a b))

(define (lower-bound a)
  (car a))

(define (upper-bound a)
  (cdr a))

(define (spans-zero? a)
  (and 
    (<= (lower-bound a) 0)
    (>= (upper-bound a) 0)))

;(div-interval (make-interval 5 10) (make-interval -4 20))

(mul-interval (make-interval -3 5) (make-interval -2 -1))

