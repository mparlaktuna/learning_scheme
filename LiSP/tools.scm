(define-module (LiSP chap1 tools)
  #:export (the-false-value
	    wrong
	    atom?))

(define the-false-value (cons "false" "boolean"))

(define (wrong msg var)
  (format #t "~a: ~a\n" msg var))

(define (atom? e)
  (not (pair? e)))
