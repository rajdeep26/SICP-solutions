(define (element-of-set? x set)
  (cond 
    ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond 
    ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2)
      (cons (car set1)
            (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (append set1 set2))

(union-set (list 1 2 3 4 5 2 2 2 2 2 2 2 2 2) (list 1 2 3 4 5 6 4 3 2 1 2 3 4 3 4 3 2))

; Since duplicates are allowed, adjoin-set procedure doesnt need to 
; check if the element is there or no. Just use cons to join
; the set and the element.
; 
; Also union can be done directly, i.e directly append both the sets.
;
; Due to this the performance of these 2 methods will be better.