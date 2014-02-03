(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

;; After this if we do (cdr x)
;; The output will be (a b) coz append 
;; does'nt change the value of x.

(define w (append! x y))

;; After this if we do (cdr x)
;; The output will be (a b c d) coz 
;; append! does change the value of x.
