(define (apply-generic op . args)
  (define (apply-generic-1 op args types)
    (if (null? types)
        (error "No method for these types" 
               (list op (map type-tag args)))
        (let ((new-args (map (lambda (x) 
                               (convert x (car types))) args)))
          (let (new-type-tags (map type-tag new-args))
            (let ((proc (get op new-type-tags)))
              (if proc
                  (apply proc (map contents new-args))
                  (apply-generic-1 op args (cdr types))))))))
  (define (convert x type)
    (let ((proc (get-coercion (type-tag x) type)))
      (if proc
          (apply proc x)
          x)))  
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (apply-generic-1 op args type-tags)))))

