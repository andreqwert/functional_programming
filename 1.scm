(define (count x xs) ; x - эл-т списка, xs - список
  (if (null? xs) 0 ; если список пустой, вернуть 0. Этот нуль и будет счётчиком.
    
  ; если первый элемент списка и искомый элемент равны...
  (if (equal? x (car xs))
     ; ...то искомое количество равно 1 + cdr от исходного списка
     (+ 1 (count x (cdr xs)))
  (+ 0 (count x (cdr xs))))))


(count 'a '(a b c a)) 

; (if ⟨предикат⟩ ⟨следствие⟩ ⟨альтернатива⟩)
; (list a b) -> (1 2)
; 1 итер: (+ 1 (count a (b c a)) 
; 2 итер: (+ 0 (count a (c a))
; 3 итер: (+ 0 (count a (a))
; 4 итер: (+ 1 (count a 0))
; (count a 0) = 0 => 4 итер: (+ 1 0) = 1
; 3 итер: (+ 0 1) = 1
; 2 итер: (+ 0 1) = 1
; 1 итер: (+ 1 1) = 2
; Ответ: 2
