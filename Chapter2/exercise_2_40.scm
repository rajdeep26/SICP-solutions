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

(define (unique-pairs n)
  (flatmap
        (lambda (i)
          (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

(unique-pairs 10)

;;;;; Using in the prime-sum-pairs procedure ;;

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum?
      (unique-pairs n))))
