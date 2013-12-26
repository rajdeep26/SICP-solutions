;Exercise 1.6
;
;"IF" was defined as a special form so that it can decide which statements should be execute and 
;which statements should not be executed depending on the condition.
;
;Now, the new-if statement has 3 operands, the predicate, then-clause and the else-clause.
;Since Scheme uses applicative order evaluation, all 3 operands will be executed as soon as the 
;new-if procedure is called, which may result in a wrong output.
;
;Ideally "IF" statement would have decided which expression to be executed depending on the condition,
; But, since all expressions are executed, it wont produce the desired result.
;
;