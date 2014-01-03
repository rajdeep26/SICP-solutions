(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if 
      (good-enough? guess)
      guess
      (iter (improve guess))))
iter)

;; Square-root in terms of iterative-improve

(define (square-root x)
  ((iterative-improve 
    (lambda (guess) 
      (< (abs (- (square guess) x)) 0.001))
    (lambda (guess) 
      (average guess (/ x guess)))) 
  1.0))

(define (average a b)
  (/ (+ a b) 2))


(square-root 16)

;; Fixed-point in terms of iterative-improve

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess) 
      (< (abs (- guess (f guess))) tolerance))
    (lambda (guess) 
      (f guess)))
  first-guess))