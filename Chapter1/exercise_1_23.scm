(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
(find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
(= (remainder b a) 0))

(smallest-divisor 47)


;With this modified version of smallest-divisor, I ran the 
;timed-prime-test procedure and the results are given below.
;
;As can be seen form the Results that the performance increase is
;not as expected. Actually it should have been twice faster as
;compared to the previous procedure, but it is only 
;1.68 (approx.) times faster than the previous procedure.
;The reason for this may be the additional "IF" condition.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     Results of First 3 Prime Numbers From    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;From 1000
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.

;Ratio : 1

;;From 10000
;10007 *** 0.
;10009 *** 0.
;10037 *** 0.

;Ratio: 1

;;From 100000
;100003 *** 0.
;100019 *** 0.
;100043 *** 0.

;Ratio: 1

;;From 1000000
;1000003 *** 0.
;1000033 *** 0.
;1000037 *** 1.0000000000000231e-2

;Ratio: 1

;;From 10000000
;10000019 *** 1.0000000000000231e-2
;10000079 *** 9.999999999999787e-3
;10000103 *** 0.

;Ratio: .9999999999999775

;;From 100000000
;100000007 *** 1.9999999999999574e-2
;100000037 *** 9.999999999999787e-3
;100000039 *** 9.999999999999787e-3

;Ratio: 1.000000000000019

;;From 1000000000
;1000000007 *** 4.0000000000000036e-2
;1000000009 *** .03000000000000025
;1000000021 *** 2.9999999999999805e-2

;Ratio: 1.2500000000000004

;;From 10000000000
;10000000019 *** .10000000000000009
;10000000033 *** .09999999999999964
;10000000061 *** .11000000000000032

;Ratio: 1.699999999999999

;;From 100000000000
;100000000003 *** .3200000000000003
;100000000019 *** .3200000000000003
;100000000057 *** .3200000000000003

;Ratio: 1.6874999999999987

;;From 1000000000000
;1000000000039 *** 1.0300000000000002
;1000000000061 *** 1.0599999999999996
;1000000000063 *** 1.0599999999999996

;Ratio:  1.6504854368932045