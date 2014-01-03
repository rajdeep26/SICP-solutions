;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Recursive                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cont-frac n d k)
  (if 
    (= k 1)
    (/ (n k) (d k))
    (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(cont-frac 
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  11)

; Inorder to get approximation accurate to 4 decimal places,
;the min value of k should be 11.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            Iterative                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cont-frac-iter n d k)
  (define (iter k results)
    (if 
      (= k 0)
      results
      (iter (- k 1) (/ (n k) (+ results (d k))))))
  (iter k 0.0))

(cont-frac-iter 
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  11)