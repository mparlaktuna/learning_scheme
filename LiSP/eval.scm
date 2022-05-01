(define-module (LiSP chap1 eval)
  #:use-module (LiSP chap1 env)
  #:use-module (LiSP chap1 tools)
  #:use-module (LiSP chap1 defs))

(define (eprogn exps env)
  "return should be unspecified element currently it is left as empty list whcih should not be the case
  empty begin should be handled"
  (if (pair? exps)
      (if (pair? (cdr exps))
	  (begin (evaluate (car exps) env)
		 (eprogn (cdr exps) env))
	  (evaluate (car exps) env))
      '()))

(define (evlis exps env)
  (define (evlis exps)
    (if (pair? (cdr exps))
	(cons (evaluate (car exps) env)
	      (evlis (cdr exps)))
	(list (evaluate (car exps) env))))
  (if (pair? exps)
      (evlis exps)
      '()))

;; (define (evlis exps env)
;;   ;; eval without specific order depends on guile
;;   (if (pair? exps)
;;       (cons (evaluate (car exps) env)
;; 	    (if (null? (cdr exps))
;; 		'()
;; 		(evlis (cdr exps) env)))
;;       '()))


;; (define (evlis exps env)
;;   ;; eval can be ordered from left to right
;;   (if (pair? exps)
;;       (let ((arg1 (evaluate (car exps) env)))
;; 	(cons arg1 (evlis (cdr exps) env)))
;;       '()))


(define (evaluate e env)
  "lisp 1 evalulate chapter 1"
  (if (atom? e)
      (cond ((symbol? e) (lookup e env))
				((or (number? e) (string? e) (char? e) (boolean? e) (vector? e)) e)
				(else (wrong "Cannot evaluate" e)))
			  (case (car e)
			    ((quote) (cadr e))
			    ((if) (if (not (eq? (evaluate (cadr e) env) the-false-value))
				      (evaluate (caddr e) env)
				      (evaluate (cadddr e) env)))
			    ((begin) (eprogn (cdr e) env))
			    ((set!) (update! (cadr e) env (evaluate (caddr e) env)))
			    ((lambda) (make-function (cadr e) (cddr e) env))
			    (else (invoke (evaluate (car e) env)
					  (evlis (cdr e) env))))))

(define (invoke fn args)
  (if (procedure? fn)
      (fn args)
      (wrong "Not a function" fn)))

(define (make-function variables body env)
  (lambda (values)
    (eprogn body (extend env variables values))))

(define (update! id env value)
  (if (pair? env)
      (if (eq? (caar env) id)
	  (begin (set-cdr! (car env) value)
		 value)
	  (update! id (cdr env) value))
      (wrong "No such binding" id)))




