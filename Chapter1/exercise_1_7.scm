;
;The given "good-enough?" method will fail for small numbers such as 0.00064
;because whenever the first 3 decimal places of any guess's sqaure are zero
;it will consider it as the square-root of that number.
;This is because of the condition specified in the "good-enough?" method.
;which squares each guess and checks for the first 3 decimal places only.
;
;
;The new "good-enough?" method should be
;
;(define (good-enough? guess prev-guess)
;  (< (abs(- guess prev-guess)) 0.001))
;
;Yes, This should work better for small numbers.
;