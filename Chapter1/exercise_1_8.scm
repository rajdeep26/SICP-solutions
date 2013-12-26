(define (good-enough? guess x)
  (< (abs(- (* guess (square guess)) x)) 0.0001))

(define (improve-guess guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root guess x)
  (if (good-enough? guess x)
    guess
    (cube-root (improve-guess guess x) x)))

(cube-root 1.0 512)