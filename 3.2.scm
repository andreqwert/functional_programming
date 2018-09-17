; ф-ция итерируется по списку из n эл-тов, где к каждому эл-ту x применяется ф-ция f
(define (iterate f x n)
  ; 1,2,3,4 -> 1, 2*1, 2*(2*1), 2*(2*(2*1)), ...
  (define (merge-lists curr-list x n)
    ; если кол-во входных эл-тов =0, то вернуть текущий на данный момент список
    (if (= n 0) curr-list
       ; иначе соединить текущий список с новым эл-том, над которым производится операция f().
       ; при этом каждый новый эл-т в список добавляется рекурсионно,
       ; а кол-во эл-тов из заданных в n с каждой итерацией рекурсии уменьшается на единицу
       (merge-lists (append curr-list (list x)) (f x) (- n 1))))
  ; 1,2,3,4 -> 1, 2*1, 2*(2*1), 2*(2*(2*1)), ...
  ; последним объединением списков является объединение пустого списка и первого элемента,
  ; как показано выше
  (merge-lists '() x n))




(iterate (lambda (x) (* 2 x)) 1 6)
(iterate (lambda (x) (* 2 x)) 1 1)
(iterate (lambda (x) (* 2 x)) 1 0)
