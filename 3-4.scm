(define (replicate x n) 
(if (= n 0) '() ; если n=0 - вернуть пустой список
; сконструировать список из эл-та x, повторяющегося (n-1) раз
(cons x (replicate x (- n 1))))) 

(replicate 'a 5)
