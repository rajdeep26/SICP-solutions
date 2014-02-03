(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;(define (stream-limit stream tolerance)
;  (cond ((<= (abs (- (car stream) (car (stream-cdr stream)))) tolerance) 
;         (car (stream-cdr stream)))))

(define (stream-limit stream tolerance)
  (if (<= (abs (- (car stream) (car (stream-cdr stream)))) tolerance)
      (car (stream-cdr stream))
      (stream-limit (stream-cdr stream) tolerance)))

;(define sqrt-series (sqrt-stream 2))
;
;(stream-ref sqrt-series 10)

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 2 0.000001)