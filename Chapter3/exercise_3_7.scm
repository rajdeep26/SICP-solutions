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

(define (make-joint account old-password new-password)
  (lambda (pass method) 
    (if (eq? pass new-password)
        (account old-password method)
        (error "Given password does'nt match!! -- MAKE-JOINT" new-password))))

(define peter-acc (make-account 100 'secret-password))
(define paul-acc
  (make-joint peter-acc 'secret-password 'rosebud))

(newline )(display ((peter-acc 'secret-password 'withdraw) 30))
(newline )(display ((peter-acc 'secret-password 'deposit) 200))
(newline )(display ((paul-acc 'rosebud 'withdraw) 120))