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

(define (element-of-set? x set)
  (cond 
    ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((element-of-set? symbol (symbols (left-branch tree))) 
         (if (leaf? (left-branch tree)) 
             '(0) 
             (cons 0 (encode-symbol symbol (left-branch tree)))))
        ((element-of-set? symbol (symbols (right-branch tree)))
         (if (leaf? (right-branch tree)) 
             '(1) 
             (cons 1 (encode-symbol symbol (right-branch tree)))))
        (else (error "Incorrect symbol -- ENCODE-SYMBOL" symbol))))

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

(define rock-words '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))

(define (count-bits bits count)
  (if (null? bits)
      count
      (count-bits (cdr bits) (+ count 1))))

(define poem 
  '(Get a job
    Sha na na na na na na na na 
    Get a job 
    Sha na na na na na na na na 
    Wah yip yip yip yip yip yip yip yip yip))

 (encode poem (generate-huffman-tree rock-words))

; We need 75 bits for encoding the poem if we use variable length code.
; 
; If we want to use fixed-length code then each symbol will require 3 bits to encode.
; And since there are 34 symbols in the poem, it would require 
; 34 * 3 bits for encoding.
; i.e 102 bits.