(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (predicate x y)
  (<= (+ (square (- x 5))
         (square (- y 7))) 
      (square 3)))

(define (estimate-integral predicate x1 x2 y1 y2 trials)
  (define (experiment)
    (predicate (random-in-range x1 x2)
               (random-in-range y1 y2)))
  (monte-carlo trials experiment))

(define (pi-approx )
  (/ (* (estimate-integral predicate 2.0 8.0 4.0 10.0 10000) 36) 
     9.0))

(define (run-estimate-pi-n-times times)
  (if (>= times 0)
      (begin
        (newline )(display (pi-approx))
        (run-estimate-pi-n-times (- times 1)))
      'done))

(run-estimate-pi-n-times 10)