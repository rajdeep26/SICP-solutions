;;Exercise 2.81

;; 2.81.a 
;; If we call exp with 2 complex numbers as the arguments then,
;; apply-generic will run into an infinite loop.

;; 2.81.b
;; "apply-generic" works correctly as it is.

;; 2.81.c

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (error "No method for these types" 
                           (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                              (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                              (apply-generic op a1 (t2->t1 a2)))
                            (else
                              (error "No method for these types"
                                     (list op type-tags)))))))
              (error "No method for these types"
                     (list op type-tags)))))))
