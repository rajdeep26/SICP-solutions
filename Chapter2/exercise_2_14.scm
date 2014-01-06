(define (add-interval x y)
  (make-interval 
    (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval 
      (- (lower-bound x) (upper-bound y))
      (- (upper-bound x) (lower-bound y))))

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

(define (spans-zero? a)
  (and 
    (<= (lower-bound a) 0)
    (>= (upper-bound a) 0)))

(define (make-interval a b) 
  (cons a b))

(define (lower-bound a)
  (car a))

(define (upper-bound a)
  (cdr a))

(define (width a)
  (/ (- (upper-bound a) (lower-bound a)) 2.0))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

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

(define (par1 r1 r2)
  (div-interval 
    (mul-interval r1 r2)
    (add-interval r1 r2)))

(define (par2 r1 r2)
  (let 
    ((one (make-interval 1 1)))
    (div-interval one
      (add-interval (div-interval one r1)
      (div-interval one r2)))))

;(par2 (make-center-percent 40 10) (make-center-percent 30 10))

;; 
;;(par1 (make-center-percent 40 10) (make-center-percent 30 10))
;;(12.623376623376624 . 23.047619047619047)
;;
;;(par2 (make-center-percent 40 10) (make-center-percent 30 10))
;;(15.428571428571429 . 18.857142857142858)
;;
;;As can be seen, both results are not the same hence Lem is right.
;;

(define A (make-center-percent 6 98))
(define B (make-center-percent 10 98 ))

(par2 (make-center-percent 40 10) (make-center-percent 30 10))

;
;Executing (par1 (make-center-percent 40 0) (make-center-percent 30 0))
;we get the following results
; (17.142857142857142 . 17.142857142857142)

;And executing (par2 (make-center-percent 40 0) (make-center-percent 30 0))
;we get the following results
; (17.142857142857142 . 17.142857142857142)
;
;Both results are same.
;But as we increase the tolerance percent, the results changes.
;for example if we change the tolrance to 1 from 0
;we get the following result
;
;par1 - (16.635360678925036 . 17.664069264069262)
;par2 - (16.97142857142857 . 17.314285714285713)
;
;When tolerance percent is 2
;
;par1 - (16.141176470588235 . 18.199416909620993)
;par2 - (16.8 . 17.485714285714284)
