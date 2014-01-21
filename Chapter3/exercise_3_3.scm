(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
          balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch given-password m)
    (if (eq? given-password password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        (error "Incorrect Password! -- DISPATCH")))
  dispatch)

(define acc (make-account 100 'secret-password))


(newline )(display ((acc 'secret-password 'withdraw) 40))

(newline )(display ((acc 'secret-password 'deposit) 200))

(newline )(display ((acc 'some-other-password 'deposit) 50))
