(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point a)
  (car a))

(define (y-point a)
  (cdr a))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment ls)
  (make-point 
    (/ (+ (x-point (start-segment ls)) (x-point (end-segment ls))) 2)
    (/ (+ (y-point (start-segment ls)) (y-point (end-segment ls))) 2)))


(print-point 
  (midpoint-segment 
    (make-segment 
      (make-point -1 2) (make-point 3 -6))))