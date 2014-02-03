(define (add-streams s1 s2)
(stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

;; This will generate the double series,
;; i.e 1 2 4 8 16 32 ....