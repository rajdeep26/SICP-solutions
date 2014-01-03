(define (smooth f dx)
  (lambda (x) 
    (/ 
      (+ (f (- x dx))
      (f x)
      (f (+ x dx)))
      3)))

((smooth inc 0.1) 1)

;;; N-fold smoothed function

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))

((n-fold-smooth inc 0.1 10) 1)