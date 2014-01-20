;; In scheme-number package

(define (negation-scheme-number x)
  (tag (- x)))
(put 'negate 'scheme-number negation-scheme-numbers)

;; In rational number package

(define (negation-rat x)
  (tag (make-rat (- (numer x)) 
                 (denom x))))
(put 'negate 'rational negation-rat)

;; In complex number package
(define (negation-complex x)
  (tag (make-complex (- (real-part x))
                     (- (imag-part x)))))
(put 'negate 'complex negation-complex)

;; In polynomial package
(define (negate-terms termlist) 
  (if (empty-termlist? termlist) 
      the-empty-termlist 
      (let ((term (first-term termlist))) 
        (adjoin-term (make-term (order term) (negate (coeff term))) 
                     (negate-terms (rest-terms termlist))))))

(define (negation-poly n)
  (make-polynomial (variable n)
                   (negate-terms (term-list n))))

(put 'negate 'polynomial negation-poly)

;; Generic negate operation
(define (negate x) 
  (apply-generic 'negate x)) 

;; Subtraction

(define (sub-terms L1 L2)
  (tag (add-terms L1 (negate L2))))