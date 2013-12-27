;The "p" procedure will be called 5 times.
;
;
;(p sine(12.15))
;(p (p sine(4.05)))
;(p (p (p sine(1.3499999999999999))))
;(p (p (p (p sine(0.44999999999999996)))))
;(p (p (p (p (p sine(0.15))))))
;(p (p (p (p (p 0.049999999999999996)))))


;As shown above th procedure p is called 5 times.


;The order of growth of this algorithm in terms of number of steps 
; and space is (log n)
;