(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;;;;;;; Exercise 2.29 a ;;;;;;;;;;;;;;

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;;;;;;; Exercise 2.29 b ;;;;;;;;;;;;;;

(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
    (branch-weight (right-branch mobile))))

;;;;;;; Exercise 2.29 c ;;;;;;;;;;;;;;

(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))  

(define (branch-balanced? branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      true))

(define (balanced? mobile)
  (and 
    (= (branch-torque (left-branch mobile))
       (branch-torque (right-branch mobile)))
    (branch-balanced? (left-branch mobile))
    (branch-balanced? (right-branch mobile))))

;;;;;;; Exercise 2.29 d ;;;;;;;;;;;;;;;

; If we change the representation of the make-branch and make-mobile
; from using list to cons then the only change will be in the accessor 
; methods i.e for right-branch and branch-structure.
;
;  (define (right-branch mobile)
;    (cdr mobile))

;  (define (branch-structure branch)
;    (cdr branch))


;;;;============= Input =========================;;;;;

(define branch-a (make-branch 10 10))
(define branch-b (make-branch 20 30))
(define branch-c (make-branch 30 40))
(define branch-d (make-branch 40 50))
(define mobile-a (make-mobile branch-a branch-b))
(define mobile-b (make-mobile branch-c branch-d))
(define branch-e (make-branch 50 mobile-a))
(define branch-f (make-branch 70 mobile-b))

(define binary-mobile (make-mobile branch-e branch-f))

(total-weight binary-mobile)


