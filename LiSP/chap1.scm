




;; (define (chapter1-scheme)
;;   (define (toplevel)
;;     (display (evaluate (read) env.global))
;;     (newline)
;;     (toplevel))
;;   (toplevel))

;; (chapter1-scheme)

;; ;; d version
;; (define (d.invoke fn args env)
;;   (if (procedure? fn)
;;       (fn args env)
;;       (wrong "Not a function" fn)))

;; (define (d.make-function variables body def.env)
;;   (lambda (values current.env)
;;     (eprogn body (extend current.env variables values))))

;; (define (d.evaluate e env)
;;   "lisp 1 evalulate chapter 1"
;;   (if (atom? e)
;;       (cond ((symbol? e) (lookup e env))
;; 	    ((or (number? e) (string? e) (char? e) (boolean? e) (vector? e)) e)
;; 	    (else (wrong "Cannot evaluate" e)))
;;       (case (car e)
;; 	((quote) (cadr e))
;; 	((if) (if (not (eq? (evaluate (cadr e) env) the-false-value))
;; 		  (evaluate (caddr e) env)
;; 		  (evaluate (cadddr e) env)))
;; 	((begin) (eprogn (cdr e) env))
;; 	((set!) (update! (cadr e) env (evaluate (caddr e) env)))
;; 	((lambda) (d.make-function (cadr e) (cddr e) env))
;; 	(else (d.invoke (d.evaluate (car e) env)
;; 			(evlis (cdr e) env)
;; 			env)))))



