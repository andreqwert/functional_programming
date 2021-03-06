(define (delete pred? xs) 
(if (null? xs) '() ; если список нулевой - вернуть пустой список
(if (pred? (car xs)) ; если первый эл-т xs удовлетворяет предикату...
    ; рекурсивно перейти к оставшемуся списку
    (delete pred? (cdr xs))
    ; иначе сконструировать список из головы и хвоста, где
    ; голова = первый эл-т списка, хвост - оставшиеся эл-ты
(cons (car xs) (delete pred? (cdr xs))))))


(delete zero? '(0 1 2 3 0)) ; удалить нули
(delete even? '(1 2 3 4 5 6)) ; удалить чётные
(delete zero? '(1 2 3 0))