(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond 
    ((null? sequence) ())
    ((predicate (car sequence))
      (cons (car sequence)
            (filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (s-sum-pairs n s)
  (define (sums-to-s? triple)
    (= (+ (car triple) (cadr triple) (caddr triple)) s))
  (filter sums-to-s?
    (flatmap 
      (lambda (i) 
        (flatmap (lambda (j) 
          (map (lambda (k) (list i j k))
              (enumerate-interval 1 (- j 1))))
        (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n))))

(s-sum-pairs 100 22)