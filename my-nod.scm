; Поиск наименьшего общего делителя

(define (my-nod-2 a b)
    (cond ((= (remainder a b) 0)
          a)
          (not (= (remainder a b) 0)
          my-nod-2 b (remainder a b))))
