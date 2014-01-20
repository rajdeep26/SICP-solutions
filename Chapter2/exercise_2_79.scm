;; In scheme-number package
(put 'equ? '(scheme-number scheme-number) =)

;; In install-rational-package
(define (equ-rat? num1 num2)
  (and (= (numer num1) (numer num2)) 
       (= (denom num1) (denom num2))))

(put 'equ? '(rational rational) equ-rat?)

;; In install-complex-package
(define (equ-complex? num1 num2)
  (and (= (real-part num1) (real-part num2))
       (= (imag-part num1) (imag-part num2))))

(put 'equ? '(complex complex) equ-complex?)

;; equ using Apply-generic procedure

(define (equ? x y)
  (apply-generic 'equ? x y))