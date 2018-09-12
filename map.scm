(define (my-map proc items)
  (if (null? items) '()
      (cons (proc (car items))
            ; Передаём хвост списка рекурсивно функции на вход
            (my-map proc (cdr items)))))

(my-map abs (list -1 -2 3 4)) ; (1 2 3 4)
