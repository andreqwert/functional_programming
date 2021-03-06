; Операция "И"
(define (and-fold . xs) ; точечная пара из операции и списка
(if (null? xs) #t
; если первое значение списка = #t, то ф-ции передается остаток списка
; (со второго элемента по энный), а иначе (если первое значение не #t),
; то результат функции = #f.
(if (equal? (car xs) #t) (apply and-fold (cdr xs)) #f)))


(and-fold #f #f #f) ; #f
(and-fold #t #f #f) ; #f

;  (if ⟨предикат⟩ ⟨следствие⟩ ⟨альтернатива⟩)

; Операция "ИЛИ"
(define (or-fold . xs) 
(if (null? xs) #f
; если первое значение списка = #f, то ф-ции передается остаток списка
; (со второго элемента по энный), а иначе (если первое значение не #f),
; то результат функции = #t.
(if (equal? (car xs) #f) (or-fold (cdr xs)) #t)))

(or-fold #f #f #f) ; #f
(or-fold #t #t #f) ; #t
