;; In complex-number package

(define (project-to-real n)
  (make-real (real-part n)))
(put 'project 'complex project-to-real)

;; In real-number package

(define (project-to-rational n)
  (let ((rat (rationalize (inexact->exact n) 1/100)))
    (make-rat (numerator rat) 
              (denominator rat))))
(put 'project 'real project-to-rational)

;; In rational-number package

(define (project-to-integer n)
  (make-scheme-number (round (/ (numer n) (denom n)))))
(put 'project 'rational project-to-integer)

(define (drop x) 
  (let ((project-proc (get 'project (type-tag x)))) 
    (if project-proc 
        (let ((project-number (project-proc (contents x)))) 
          (if (equ? project-number (raise project-number)) 
              (drop project-number) 
              x)) 
        x))) 

;; Apply Generic procedure

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (drop (map contents args)))
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