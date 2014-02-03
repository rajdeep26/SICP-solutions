(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; If we try to compute (last-pair z)
;; It will run into an infinite loop 