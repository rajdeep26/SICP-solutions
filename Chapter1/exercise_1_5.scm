;Exercise 1.5
;
;If the interpreter uses Applicative-order evaluation, then when we call the test procedure as
; (test 0 (p) ) it wont give any output as the operands are evaluated when the procedure is called.
;The reason there wont be any output is because, when (p) will be evaluated, it will replace
;(p) with (p), and then again (p) with (p), which will go on continuously.
;
;If the interpreter uses Normal-order evaluation then the operands are not evaluated unless needed,
;so the procedure will be called and the output will be 0. 
;
;
;
;