(define (find-divisors n)
    (let loop ((d 1))
      (cond
       ((>= d n) '())
       ((eq? 0 (remainder n d)) (cons d (loop (+ 1 d))))
       (else (loop (+ 1 d))))))

(define (sum-divisors n)
  (apply + (find-divisors n)))

(let loop ((n 1)
	   (sum '()))
  (if (eq? n 10000)
      (begin
	(display sum)
	(/ (apply + sum) 2))
      (let* ((sd (sum-divisors n))
	     (od (sum-divisors sd)))
	(if (and (eq? od n) (< od 10000) (not (eq? sd n)))
	    (loop (+ n 1) (cons n (cons sd sum)))
	    (loop (+ n 1) sum)))))

	  

