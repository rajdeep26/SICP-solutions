;Exercise 1.9
;
;From the given 2 procedures, the first procedure is a recursive process, 
;while the second procedure is an iterative process.
;
;1st procedure upon using substitution model for (+ 4 5)
;
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)

;Result ===>  9

;2nd procedure upon using substitution model for (+ 4 5)

(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)

;Result ====>  9