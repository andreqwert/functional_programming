; Переменные - это символы. Они распознаются с помощью symbol?
(define (variable? x) (symbol? x))

; Две переменные одинаковы, если для представляющих их символов выполняется eq?
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Суммы и произведения конструируются как списки
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

; Первое слагаемое - второй элемент списка, представляющего сумму
(define (addend s) (cadr s))

; Второе слагаемое - третий элемент списка, представляющего сумму
(define (augend s) (caddr s))

; Первый множитель - второй элемент из списка, представляющего произведение
(define (multiplier p) (cadr p))

; Второй множитель - третий элемент из списка, представляющего произведение
(define (multiplicand p) (caddr p))

; Сумма - это список, первый элемент которого равен +.
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

; Разность - это список, первый элемент которого равен -.
(define (sub? x)
  (and (pair? x) (eq? (car x) '-)))

; Произведение - это список, первый элемент которого равен *.
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

; Проверка, не равно ли выражение определенному числу
(define (=number? exp num)
  (and (number? exp) (= exp num)))

; Выполнить произведение чисел m1 и m2
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) ; нечто, умноженное на 0, есть 0
        ((=number? m1 1) m2) ; нечто, умноженное на 1, равно самому себе
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) ; является ли exp переменной?
         (if (same-variable? exp var) 1 0)) ; являются ли exp и var одной и той же переменной?
        ((sum? exp) ; является ли exp суммой?
         (make-sum (deriv (addend exp) var) ; 
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
         (make-product (multiplier exp)
                       (deriv (multiplicand exp) var))
         (make-product (deriv (multiplier exp) var)
                       (multiplicand exp))))
         (else
         (error "Неизвестый тип выражения -- DERIV" exp))))
                        
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)

