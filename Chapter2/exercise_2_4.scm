;;Exercise 2.4

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;;Evaluating (car (cons x y))

;(car (cons x y))

;(car (lambda (m) (m x y)))

;((z (lambda (p q) p)) (lambda (m) (m x y)))

;((lambda (m) (m x y)) (lambda (p q) p))

;((lambda (p q) p) x y)

;Answer : x

;;;Procedure for calculating cdr

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 14 22))