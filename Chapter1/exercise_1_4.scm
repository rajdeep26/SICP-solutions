;Exercise 1.4
;
;Given Procedure
;
;(define (a-plus-abs-b a b)
;	((if (> b 0) + -) a b))
;
;
;The given procedure will always calculate the value as a+abs(b)
;
;===> If the given value of b is positive then the compund expression will evaluate
;to '+' and the result will be a+b
;
;===> If the given value of b is 0 or negative then the compaund expression will
;evaluate to '-' and the given result will be a-(-b) ie a=b
;
;In both cases, the result will be the same.
;