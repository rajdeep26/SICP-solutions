(list 'a 'b 'c)
;; Answer : (a b c)

(list (list 'george))
;; Answer : ((george))

(cdr '((x1 x2) (y1 y2)))
;; Answer : ((y1 y2))

(cadr '((x1 x2) (y1 y2)))
;; Answer : (y1 y2)

(pair? (car '(a short list)))
;; Answer : false

(memq 'red '((red shoes) (blue socks)))
;; Answer : false

(memq 'red '(red shoes blue socks))
;; Answer : (red shoes blue socks)