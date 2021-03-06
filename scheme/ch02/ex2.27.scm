#lang scheme 
(require (planet schematics/schemeunit:3))

(define (reverse l)
  (define (rev l result)
    (cond ((null? l) result)
          (else (rev (cdr l) (cons (car l) result)))))
  (rev l '()))
              
(define (deep-reverse l)
  (define (rev l result)
    (cond ((null? l) result)
          ((pair? (car l)) (rev (cdr l) (cons (rev (car l) '()) result)))
          (else (rev (cdr l) (cons (car l) result)))))
  (rev l '()))

(check-equal? (reverse (list (list 1 2) (list 3 4))) (list (list 3 4) (list 1 2)))
(check-equal? (deep-reverse (list (list 1 2) (list 3 4))) (list (list 4 3) (list 2 1)))
(check-equal? (deep-reverse (list 10 (list 1 2) 20 (list 3 4) 30)) (list 30 (list 4 3) 20 (list 2 1) 10))
(check-equal? (deep-reverse (list 1 2 3 4 5 6)) (list 6 5 4 3 2 1))
(check-equal? (deep-reverse (list 1 2)) (list 2 1))
(check-equal? (deep-reverse (list 1)) (list 1))
(check-equal? (deep-reverse (list)) (list))
