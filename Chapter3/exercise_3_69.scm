(define (pairs s t)
  (cons-stream  
    (list (stream-car s) (stream-car t))
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))

(define (triples s t u)
  (cons-stream 
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (cons (stream-car s)  x))
                  (pairs t (stream-cdr u)))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (pythagorean-triple? a b c)
  (= (+ (square a) (square b)) (square c)))

(define pythagorean-triple-stream 
  (stream-filter (lambda (triple)
                   (pythagorean-triple? (car triple) (cadr triple) (caddr triple)))
                 (triples integers integers integers)))

(define triples-stream
  (triples integers integers integers))

(stream-ref triples-stream 500000)

;(stream-ref pythagorean-triple-stream 10)