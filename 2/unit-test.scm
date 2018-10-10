(define-syntax test
  (syntax-rules () ; синтаксические правила, пока оставим пустыми
    ; структура теста: в заполнитель вставляется test
    ; заместо expr -> функция (в нашем случае signum) и ожидаемый результат (в нашем случае -1, например)
    ; формат теста: (test (signum -2) -1))
    ((_ expr res) (cons (quote expr) res))))

(define (run-test tests)
  (display (car tests)) (display '#\ )
  ; eval принимает выражение первым аргументом и среду, в которой это выражение будет подсчитано
  ; если ожидаемый ответ равен реальному, то ок (проверка выполняется при помощи AND)
  (if (equal? (eval (car tests) (interaction-environment)) (cdr tests))
      (and (display "ok") (newline))
      (and (display "FAIL\n")
           ; иначе мы выводим на экран то, что ожидалось, и то, что получилось, и передаем на вход рекурсивно остальные тесты
           (display "  Expected: ") (display (cdr tests)) (newline)
           (display "  Returned: ") (display (eval (car tests) (interaction-environment)))
           (newline)))
  ; на каждой из итераций передавать остаток тестов
  (equal? (eval (car tests) (interaction-environment)) (cdr tests)))


; функция по запуску: если какой-то из тестов не прошел, то присвоить #f по итогам тестирований
(define (run-tests testsss) 
   ; проверяем список тестов на пустоту
   (if (null? testsss)
       #t
       (if (run-test (car testsss))
           (run-tests (cdr testsss))
           (and (run-tests (cdr testsss)) #f))))