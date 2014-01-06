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


(sub-interval (make-interval 5 10) (make-interval 10 20))
