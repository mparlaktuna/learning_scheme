(define (factorial n)
  (let fact ((n n))
    (if (eq? n 0)
	1
	(* n (fact (- n 1))))))

(define (sum-digits n)
  (let ((ns (string->list (number->string n))))
    (let loop ((l ns))
      (if (null? l)
	  0
	  (begin
	    (+ (string->number (string (car l))) (loop (cdr l))))))))
      
    


(sum-digits (factorial 100))
