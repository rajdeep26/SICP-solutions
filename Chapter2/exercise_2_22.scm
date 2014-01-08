(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
        (cons 
          (square (car things))
          answer))))
  (iter items ()))

; The reason the answer list is in reverse order is because
; after squaring the number, it is given as the second argument 
; to the cons, and the first argument is the recursive call to 
; the same function.
; In this way the last element in the list will be the first element 
; of the answer list. Hence the results are in reverse order.
;
;The solution to the above problem is to interchange the arguments in cons
; like this.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
        (cons 
          answer
          (square (car things))))))
  (iter items ()))


; But this also does'nt provide thedesired output.
; It is because the first argument of the cons is a list and
; the second argument is an integer.
; So in a way, we are pairing a list and a integer like this
; ((1). 2)
;
;;The solution to this problem is to use append method
;; like this:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
        (append 
          answer
          (list (square (car things)))))))
  (iter items ()))

(square-list (list 1 2 3 4 5))