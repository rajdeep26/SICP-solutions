;; We will need to change these procedures in rational-number package

(define (add-rat x y)
  (make-rat (add (mul (numer x) (denom y))
                 (mul (numer y) (denom x)))
            (mul (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (sub (mul (numer x) (denom y))
                 (mul (numer y) (denom x)))
            (mul (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (mul (numer x) (numer y))
            (mul (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (mul (numer x) (denom y))
            (mul (denom x) (numer y))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(put 'gcd 'polynomial gcd-poly)
