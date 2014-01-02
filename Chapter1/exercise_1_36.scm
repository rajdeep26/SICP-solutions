(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (newline )
    (display guess)
    (display " Count=")
    (display count)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
      (try next (+ count 1)))))
  (try first-guess 1))

(define (average a b)
  (/ (+ a b) 2))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)

;Without average damping the number of steps required to converge
;to the final value were around 30.
;
;But with Average damping the required number of steps came 
;down to 10 (approx.)
