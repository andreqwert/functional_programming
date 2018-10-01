(define-syntax trace-ex
  (syntax-rules ()
    ; выполняется вывод значения в консоль,
    ; выполняется перевод на новую строку,
    ; выполняется возврат списка в программу
    ((_ xs) (and (write (quote xs))
              (display " => ")
              (write xs)
              (newline)
              xs))))


; (car xss) => (1 2 3)
; xss => ((1 2 3) (one two three))
; (car xss) => (2 3)
; xss => ((2 3) (two three))
; (car xss) => (3)
; xss => ((3) (three))
; (car xss) => ()
; ((1 one) (2 two) (3 three))
