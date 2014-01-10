(define (square-tree tree)
  (tree-map square tree))

(define (tree-map proc tree)
  (cond 
    ((null? tree) ())
    ((not (pair? tree)) (proc tree))
    (else 
      (cons (tree-map proc (car tree))
            (tree-map proc (cdr tree))))))

(square-tree (list 1 2 3 (list 4 5 (list 6 (list 7)))))