(define (pairs s t)
  (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                t)
    (pairs (stream-cdr s) (stream-cdr t))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(stream-ref (pairs integers integers) 1)

; No. this wont work because the when interleave is called 
; It requires 2 argument.
; First can cbe calculated easily, but
; when we evaluate the 2nd argument, it calls the same
; function again, in which we again calculate the arguments 
; for the interleave function.
; So this will go into an infinite loop and
; we wont get the 2nd argument for the interleave function.
; Hence nothing will be displayed.