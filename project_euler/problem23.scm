(define (find-divisors n)
    (let loop ((d 1))
      (cond
       ((>= d n) '())
       ((eq? 0 (remainder n d)) (cons d (loop (+ 1 d))))
       (else (loop (+ 1 d))))))

(define (sum-divisors d)
  (apply + (find-divisors d)))

(define (is-abundant? d)
  (< d (sum-divisors d)))

