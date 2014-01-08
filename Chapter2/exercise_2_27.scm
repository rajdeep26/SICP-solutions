(define (deep-reverse items)
  (cond 
    ((null? items) ())
    ((pair? (car items)) 
      (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
    (else 
      (append (deep-reverse (cdr items)) (list (car items))))))

(deep-reverse (list 1 2 (list 3 4) 5))

