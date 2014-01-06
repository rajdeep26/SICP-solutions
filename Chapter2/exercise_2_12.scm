(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

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

(define (make-center-percent c p)
  (let 
    ((diff (x-percent-of-y p c)))
    (make-interval (- c diff) (+ c diff))))

(define (x-percent-of-y x y)
  (* (/ x 100.0) y))

(define (percent i)
  (let 
    ((c (center i))
    (diff (- (upper-bound i) (center i))))
    (* (/ diff c) 100.0)))


(add-interval (make-center-percent 40 10) (make-center-percent 30 10))