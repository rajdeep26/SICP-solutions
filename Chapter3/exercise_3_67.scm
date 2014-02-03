(define (pairs s t)
  (cons-stream  
    (list (stream-car s) (stream-car t))
    (interleave
      (interleave 
        (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
        (stream-map (lambda (x) (list x (stream-car s))) (stream-cdr t)))
      (pairs (stream-cdr s) (stream-cdr t)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define even-pair-stream 
  (stream-filter (lambda (pair)
                   (even? (+ (car pair) (cadr pair))))
                 (pairs integers integers)))

(define pair-stream 
  (interleave integers integers))

(stream-ref (pairs integers integers) 15)