;Recursive Procedure

(define (f n)
  (cond 
    ((< n 3) n)
    (else (+ 
      (f (- n 1)) 
      (* 2 (f (- n 2))) 
      (* 3 (f (- n 3)))))))

(f 5)

;Iterative Procedure

(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
        a
        b
        (- count 1))))

(f 1)