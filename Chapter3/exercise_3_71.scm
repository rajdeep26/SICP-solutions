(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (cond ((< (weight s1car) (weight s2car))
                   (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
                  ((> (weight s1car) (weight s2car))
                   (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight)))
                  (else
                    (cons-stream s1car
                                 (merge-weighted (stream-cdr s1)
                                                 (stream-cdr s2)
                                                 weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream  
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

(define (cube x)
  (* x x x))

(define (weight pair)
  (+ (cube (car pair)) 
     (cube (cdr pair))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define result 
  (stream-filter (lambda (pair) 
                   (= (weight pair) (weight (stream-cdr pair))))
                 (weighted-pairs integers integers weight)))

(stream-ref result 50)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(define (Ramanujan s)
;  (define (stream-cadr s) (stream-car (stream-cdr s)))
;  (define (stream-cddr s) (stream-cdr (stream-cdr s)))
;  (let ((scar (stream-car s))
;        (scadr (stream-cadr s)))
;    (if (= (sum-triple scar) (sum-triple scadr)) 
;        (cons-stream (list (sum-triple scar) scar scadr)
;                     (Ramanujan (stream-cddr s)))
;        (Ramanujan (stream-cdr s)))))

;(define (triple x) (* x x x))

;(define (sum-triple x) (+ (triple (car x)) (triple (cadr x))))

;(define Ramanujan-numbers
;  (Ramanujan (weighted-pairs integers integers sum-triple)))

;(stream-ref Ramanujan-numbers 10)