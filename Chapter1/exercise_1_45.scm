(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
      (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (expt-iter b n a)
  (cond 
    ((= n 0) a)
    ((even? n) (expt-iter (square b) (/ n 2) a))
    (else (expt-iter b (- n 1) (* a b) ))))

(define (myexpt b n)
  (expt-iter b n 1))

(define (average a b)
  (/ (+ a b) 2.0))

(define (nth-root x n)
  (fixed-point 
    ((repeated average-damp (floor (/ (log n) (log 2)))) 
      (lambda (y) (/ x (myexpt y (- n 1)))))
    1.0))

(nth-root 256 8)