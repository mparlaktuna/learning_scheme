(define-module (LiSP chap1 defs)
  #:use-module (LiSP chap1 env)
  #:use-module (LiSP chap1 tools))


(definitial t #t)
(definitial f the-false-value)
(definitial nil '())
(definitial foo)
(definitial bar)
(definitial fib)
(definitial fact)
(definitial list (lambda (values) values))

(defprimitive cons cons 2)
(defprimitive car car 1)
(defprimitive set-cdr! set-cdr! 2)
(defprimitive + + 2)
(defprimitive eq? eq? 2)
(defprimitive quit quit 0)
(defpredicate < < 2)
