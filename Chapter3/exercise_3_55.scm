(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (partial-sum stream)
  (cons-stream (stream-car stream)
               (add-streams (partial-sum stream) 
                            (stream-cdr stream))))

(define partial-integer-sum (partial-sum integers))


(stream-ref partial-integer-sum 5)