(define (tower-level x) 
  (let ((typex (type-tag x)))
    (cond ((eq? typex 'rational) 1)
          ((eq? typex 'complex) 3)
          (else
           (let ((y (contents x)))
             (if (exact-integer? y)
                 0
                 2))))))

(define (raise-to level x)
  (if (= level (tower-level x))
      x
      (raise-to level (raise x))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((a1 (car args))
                    (a2 (cadr args)))
                (let ((level1 (tower-level a1))
                      (level2 (tower-level a2)))
                  (cond ((< level1 level2) 
                         (apply-generic op (raise-to level2 a1) a2))
                        ((< level2 level1) 
                         (apply-generic op a1 (raise-to level1 a2))))))
              (error "No method for these types -- APPLY-GENERIC" 
                     (list op type-tags)))))))