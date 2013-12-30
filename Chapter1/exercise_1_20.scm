;Exercise 1.20
;
;Since Scheme uses Applicative order evaluation, and as can be seen from
;the exmaple that, 4 remainder operations are performed. 
;
;In nomal-order evaluation, 
;It requires 18 remainder operations for (gdc 206 40)
;
;Given procedure

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;for (gcd 206 40)

;1st call

;(define (gcd 206 40)
;  (if (= 40 0)
;      206
;      (gcd 40 (remainder 206 40))))

;2nd call

;(define (gcd 40 (remainder 206 40))
;  (if (= (remainder 206 40) 0)
;      40
;      (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

;3rd call

;(define (gcd (remainder 206 40) (remainder 40 (remainder 206 40)) )
;  (if (= (remainder 40 (remainder 206 40)) 0)
;      (remainder 206 40)
;      (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;And it goes on...til b becomes zero.