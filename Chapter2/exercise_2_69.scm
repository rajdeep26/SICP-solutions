(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) 
  (cadr x))

(define (weight-leaf x) 
  (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) 
  (car tree))

(define (right-branch tree) 
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)   
                               (cadr pair)) 
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge list-of-pairs)
  (cond ((null? list-of-pairs) '())
        ((null? (cddr list-of-pairs)) list-of-pairs)
        (else (successive-merge 
                (adjoin-set (make-code-tree (car list-of-pairs) (cadr list-of-pairs))
                            (cddr list-of-pairs))))))

(define huff-pairs '((a 4) (b 2) (c 1) (d 1)))

(generate-huffman-tree huff-pairs)