(define (=zero? x)
  (apply-generic '=zero? x))

;; In scheme-number package
(put '=zero? '(scheme-number scheme-number) 
     (lambda (x) (= x 0)))

;; In install-rational-package
(define (=zero-rat num)
  (= (numer num) 0))

(put '=zero? '(rational) =zero-rat)

;; In install-complex-package
(define (=zero-complex num)
  (= (real-part num) (imag-part num) 0))

(put '=zero? '(complex) =zero-complex)