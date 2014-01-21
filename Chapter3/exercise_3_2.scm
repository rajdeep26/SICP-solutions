(define (make-monitored f)
  (define counter 0)
  (define (mf n)
    (cond ((eq? n 'how-many-calls?) counter)
          ((eq? n 'reset-count) (set! counter 0))
          (else (begin (set! counter (+ counter 1))
                  (f n)))))
  
  mf)

(define s (make-monitored sqrt))

(newline )(display (s 100))
(newline )(display (s 100))
(newline )(display (s 'how-many-calls?))
(newline )(display (s 100))
(newline )(display (s 'how-many-calls?))
