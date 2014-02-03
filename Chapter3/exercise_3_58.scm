(define (expand num den radix)
  (cons-stream
    (quotient (* num radix) den)
    (expand (remainder (* num radix) den) den radix)))

(define myseries (expand 1 7 10))

(stream-ref myseries 20)