(use-modules (ice-9 textual-ports))
(call-with-input-file "p022_names.txt"
  (lambda (port)
    (let* ((t (get-line port))
	   (l (string-split t #\,))
	   (s (sort l string<?)))
      (let loop ((c 1)
		 (s s))
	(if (null? s)
	    0
	    (+ (calculate-score (car s) c)
	       (loop (+ c 1) (cdr s))))
	))))


(define (calculate-score s i)
  (let* ((sl (string->list s))
	 (sc (* i (apply + (map char-score sl)))))
    (format #t "~a ~a ~a ~a\n" s sl sc i)
    sc))

(define (char-score c)
  (if (eq? c #\")
      0
      (+ 1 (- (char->integer c) (char->integer #\A)))))

(char-score #\A)
(char-score #\B)
(char-score #\R)
(char-score #\N)
(calculate-score "COLIN" 938)
