(define-syntax trace-ex
  (syntax-rules ()
    ; выполняется вывод значения в консоль,
    ; выполняется перевод на новую строку,
    ; выполняется возврат списка в программу
    ; ((_ xs) (and (display xs) (newline) xs))))
    ((_ xs) (and (write (quote xs))
              (display " => ")
              (write xs)
              (newline)
              xs))))
