;Thw golden ratio is defined as Φ^2 = Φ + 1
;so divide my Φ on both side to obtain 
;  Φ = (Φ + 1)/Φ
;Separate the Φ on the right side of the equation
;we get:
;Φ = 1 + (1/Φ)
;
;using x in place of Φ, the result is
; x = 1 + (1/x)

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

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)