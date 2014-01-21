(define random-init 2526)
(define rand 
  (let ((x random-init))
    (define (dispatch method)
      (cond ((eq? method 'generate)
             (begin 
               (set! x (rand-update x))
               x))
            ((eq? method 'reset) 
             (lambda (new-x)
               (set! x new-x)))
            (else (error "Undefined Method! -- DISPATCH" method))))
    dispatch))

(define (rand-update x)
  (modulo (- (* x 234533) 3433) 1000))

(newline )(display (rand 'generate))
(newline )(display (rand 'generate)) 
((rand 'reset) 925)
(newline )(display (rand 'generate))