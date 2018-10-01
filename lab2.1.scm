(load "trace.scm")

(define (zip . xss)
  ; если первый элемент списка нулевой
  (if (or (null? xss)
          ; или первый элемент из списка, подвергнувшийся трассировке, нулевой
          (null? (trace-ex (car xss))))
      '()
      ; сконструировать соответствие между каждым элементом исходного списка
      ; и каждым элементом списка трассировки
      (cons (map car xss)
            (apply zip (map cdr (trace-ex xss))))))

(zip '(1 2 3) '(one two three))
