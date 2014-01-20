;; In scheme-number package

(define (sine-scheme-number x)
  (tag (sin x)))
(define (cosine-scheme-number x)
  (tag (cos x)))
(put 'sine 'scheme-number sine-scheme-number)
(put 'cosine 'scheme-number cosine-scheme-number)

;; In rational-number package

(define (sine-rat x)
  (tag (sin (/ (numer x) (denom x)))))
(define (cosine-rat x)
  (tag (cos (/ (numer x) (denom x)))))
(put 'sine 'rational sine-rat)
(put 'sine 'rational cosine-rat)

(define (sine x) 
  (apply-generic 'sine x)) 

(define (cosine x) 
  (apply-generic 'cosine x))