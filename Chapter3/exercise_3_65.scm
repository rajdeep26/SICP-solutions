(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
        (apply proc (map stream-car argstreams))
        (apply stream-map
               (cons proc (map stream-cdr argstreams))))))

(define (stream-limit stream tolerance)
  (if (<= (abs (- (car stream) (car (stream-cdr stream)))) tolerance)
      (car (stream-cdr stream))
      (stream-limit (stream-cdr stream) tolerance)))

(define (partial-sum stream)
  (cons-stream (stream-car stream)
               (add-streams (partial-sum stream) 
                            (stream-cdr stream))))

(define (natural-log-series x)
  (cons-stream (/ 1.0 x)
               (stream-map - (natural-log-series (+ x 1)))))

(define (almost-equal? stream number count)
  (if (<= (abs (- (car stream) number)) 0.001)
      (begin 
        (newline )
        (display count)
        (car stream))
      (almost-equal? (stream-cdr stream) number (+ count 1))))

(define my-series (partial-sum (natural-log-series 1)))

;(stream-ref myseries 20)
(almost-equal? my-series (log 2) 0)