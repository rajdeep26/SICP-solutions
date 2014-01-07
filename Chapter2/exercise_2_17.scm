(define (last-pair mylist)
  (if 
    (null? (cdr mylist))
    (list (car mylist))
    (last-pair (cdr mylist))))

(last-pair (list 1 2 3 4 5))