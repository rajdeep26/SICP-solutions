(define (make-account balance password)
  (define counter 0)
  
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
          balance)
        "Insufficient funds"))
  
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (throw-error-message n)
    (display counter))  ; Actually, This should throw an error.
  
  (define (call-the-cops n)
    (display "COPS: Hands Up!!"))
  
  (define (dispatch given-password m)
    (if (eq? given-password password)
        (begin 
          (set! counter 0)
          (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m))))
        (begin
          (set! counter (+ counter 1))
          (if (>= counter 7)
              call-the-cops
              throw-error-message))))
  dispatch)

(define acc (make-account 100 'secret-password))

(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'secret-password 'deposit) 100)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)
(newline )((acc 'some-other-password 'deposit) 50)