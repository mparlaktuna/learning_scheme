(define-module (LiSP chap1 env)
  #:use-module (LiSP chap1 tools)
  #:export (lookup
	    extend
	    env.global
	    definitial
	    defprimitive
	    defpredicate))


(define env.init '())
(define env.global env.init)

(define-syntax definitial
  (syntax-rules ()
    ((_ name)
     (begin (set! env.global (cons (cons 'name 'void) env.global))
	    'name))
    ((_ name value)
     (begin (set! env.global (cons (cons 'name value) env.global))
	    'name))))

(define-syntax defprimitive
  (syntax-rules ()
    ((_ name value arity)
     (definitial name
       (lambda (values)
	 (if (= arity (length values))
	     (apply value values)
	     (wrong "Incorrect arity" (list 'name values))))))))

(define-syntax defpredicate
  (syntax-rules ()
    ((_ name value arity)
     (defprimitive name
       (lambda values (or (apply value values) the-false-value))
       arity))))

(define (lookup id env)
  (if (pair? env)
      (if (eq? (caar env) id)
	  (cdar env)
	  (lookup id (cdr env)))
      (wrong "No such binding" id)))

(define (extend env variables values)
  (cond ((pair? variables)
	 (if (pair? values)
	     (cons (cons (car variables) (car values))
		   (extend env (cdr variables) (cdr values)))
	     (wrong "Too less values" 0)))
	((null? variables)
	 (if (null? values)
	     env
	     (wrong "Too much values" 9)))
	((symbol? variables) (cons (cons variables values) env))))
