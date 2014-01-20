
;; In scheme-number package
(define (make-rational n)
  (make-rational n 1))

(put-coercion 'integer 'rational make-rational)


;; In rational number package
(define (make-real n)
  (/ (numer n)
     (denom n)))

(put-coercion 'rational 'real make-real)

;; In real number package
(define (make-complex n)
  (make-from-real-imag n 0)) 

(put-coercion 'real 'complex make-complex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (raise arg)
  (apply-generic 'raise arg))