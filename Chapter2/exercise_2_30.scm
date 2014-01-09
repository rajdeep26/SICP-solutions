(define (square-tree tree)
  (cond 
    ((null? tree) ())
    ((not (pair? tree)) (square tree))
    (else 
      (cons (square-tree (car tree))
            (square-tree (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree) 
        (if (pair? sub-tree)
            (square-tree sub-tree)
            (square sub-tree)))
      tree))

(square-tree (list 1 2 3 (list 4 5 (list 6 (list 7)))))