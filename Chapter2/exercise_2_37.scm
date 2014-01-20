(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if 
    (null? (car seqs))
    ()
    (cons (accumulate op init 
            (accumulate (lambda (x y) 
                        (cons (car x) y)) () seqs))
          (accumulate-n op init 
            (accumulate (lambda (x y) 
                        (cons (cdr x) y)) () seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons () mat))

(define (matrix-*-matrix m n)
  (let 
    ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define vector (list 1 2 3))

;;;;;;;;; Inputs ;;;;;;;;;;;;;;

;(dot-product (list 1 2 3) (list 4 5 6))
;(transpose matrix)
;(matrix-*-vector matrix vector)
(matrix-*-matrix matrix matrix)

