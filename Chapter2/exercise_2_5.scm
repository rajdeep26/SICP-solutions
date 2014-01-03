(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (div n d)
  (define (iter n result)
    (if 
      (= (remainder n d) 0)
      (iter (/ n d) (+ result 1))
      result))
  (iter n 0))

(define (car n)
  (div n 2))

(define (cdr n)
  (div n 3))

(cdr (cons 2 5))