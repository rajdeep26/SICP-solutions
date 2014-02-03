(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC resistance capacitance dt)
  (define (create-voltage-stream i initial-voltage)    
    (add-streams (integral (scale-stream i (/ 1 capacitance)) initial-voltage dt)
                 (scale-stream i resistance)))
  create-voltage-stream)

(define RC1 (RC 5 1 0.5))

(define ones (cons-stream 1 ones))

(stream-ref (RC1 ones 2) 10)