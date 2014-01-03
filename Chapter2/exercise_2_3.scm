;By combining 2 diagonally-opposite points
(define (make-rect a b)
  (cons a b))

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

(define (rect-height a)
  (- (y-point (cdr a)) (y-point (car a))))

(define (rect-width a)
  (- (x-point (cdr a)) (x-point (car a))))

(define (rect-perimeter a)
  (* 2 (+ (rect-width a) (rect-height a))))

(define (rect-area a)
  (* (rect-height a) (rect-width a)))

(rect-perimeter
    (make-rect (make-point 1 1) (make-point 5 4)))

;;Alternate way to represent rectangle could be using all 4 points,
;;OR using only height and the width,
;;OR using a point, height and the width.