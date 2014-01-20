;; In Polynomial-number package

(define (=zero? n)
  (define (zero-terms? termlist) 
    (or (empty-termlist? termlist) 
        (and (=zero? (coeff (first-term termlist))) 
             (zero-terms? (rest-terms termlist)))))
  (zero-terms? (term-list n)))

(put '=zero? 'polynomial =zero?)
