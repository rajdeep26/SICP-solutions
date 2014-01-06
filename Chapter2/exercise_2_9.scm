(define (mul-interval x y)
  (let 
    ((p1 (* (lower-bound x) (lower-bound y)))
    (p2 (* (lower-bound x) (upper-bound y)))
    (p3 (* (upper-bound x) (lower-bound y)))
    (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval 
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4))))

(define (add-interval x y)
  (make-interval 
    (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))))

(define (make-interval a b) 
  (cons a b))

(define (lower-bound a)
  (car a))

(define (upper-bound a)
  (cdr a))

(define (sub-interval x y)
  (make-interval 
      (- (lower-bound x) (upper-bound y))
      (- (upper-bound x) (lower-bound y))))

(define (width a)
  (/ (- (upper-bound a) (lower-bound a)) 2.0))

(width (make-interval 5 12))

;;  Thw width of [(a b) + (x y)] is
;;  = [(b+y) - (a+x)]/2
;; 
;;  The width of intervals
;;  = width(a b) + width(x y)
;;  = (b-a)/2 + (y-x)/2
;;  = [(b-a) + (y-x)]/2
;;  = [ b -a + y - x]/2
;;  = [(b+y) - (a+x)]/2

;; As can be seen both are same

;;(width (mul-interval (make-interval 5 10) (make-interval 10 20)))
;Answer = 75.0
;;(* (width (make-interval 5 10)) (width (make-interval 10 20)))
;Answer = 12.5

;;Hence for multiplication, the width of the combination is NOT a function 
;;of the widths of the argument intervals.