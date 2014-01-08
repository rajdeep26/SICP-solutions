(define (for-each proc items)
  (cond 
    ((null? items) #t)
    (else (proc (car items)) 
      (for-each proc (cdr items)))))

(for-each (lambda (x) (newline) (display (square x)))
(list 1 2 3 4 5 7 8 9 10))