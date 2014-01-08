(define (same-parity a . z)
  (define (same-parity-iter mylist result)
    (if (null? mylist)
        result
        (same-parity-iter (cdr mylist)
          (if 
            (= (remainder (car mylist) 2) 
                (remainder a 2))
                  (append result (list (car mylist)))
                result))))
  (same-parity-iter z (list a)))

(same-parity 2 3 4 5 6 7 8)