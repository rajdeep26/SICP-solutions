(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse mylist)
  (if (null? mylist)
      mylist
      (append (reverse (cdr mylist)) (list (car mylist)))))

(reverse (list 1 2 3 45 55))