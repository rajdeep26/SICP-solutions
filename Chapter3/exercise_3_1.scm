(define (make-accumulator n)
  (lambda (x) 
    (set! n (+ n x))
    n))

(define A (make-accumulator 10))

(newline )(display (A 10))

(newline )(display (A 10))

(newline )(display (A 20))

(newline )(display (A 10))