(use-modules (srfi srfi-1))

(define days '(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
(define months '(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec))
(define 30-day-months '(Sep Apr Jun Nov))
(define 31-day-months '(Jan Mar May Jul Aug Oct Dec))

(define (days-of-month date)
  (let ((mon (get-month-name date))
	(year (get-year date)))
    (cond
     ((memq mon 30-day-months) 30)
     ((memq mon 31-day-months) 31)
     ((eq? 'Feb mon) (if (leap? year)
			 29
			 28)))))

(define (get-day date)
  (first date))

(define (get-month date)
 (second date))

(define (get-month-name date)
  (list-ref months (get-month date)))

(define (get-year date)
  (third date))

(define (get-week-day date)
  (fourth date))

(define (get-week-day-name date)
  (list-ref days (get-week-day date)))

(define (leap? year)
  (if (eq? 0 (remainder year 100))
      (eq? 0 (remainder year 400))
      (if (eq? 0 (remainder year 4)) 
	  #t
	  #f)))

(define (check-month-limit? date)
  (let ((day (get-day date))
	(mon (get-month date))
	(year (get-year date))
	(w-day (get-week-day date)))
    (if (> mon 11)
	(list day 0 (+ 1 year) w-day)
	(list day mon year w-day))))

(define (check-day-limit? date)
  (let ((dl (days-of-month date))
	(day (get-day date))
	(mon (get-month date))
	(year (get-year date))
	(w-day (get-week-day date)))
    (when (eq? w-day 7)
      (set! w-day 0))
    (when (> day dl)
      (set! day 1)
      (set! mon (+ mon 1)))
    (check-month-limit? (list day mon year w-day))))

(define (next-date date)
  (let ((day (get-day date))
	(mon (get-month date))
	(year (get-year date))
	(w-day (get-week-day date)))
    (check-day-limit? (list (+ day 1) mon year (+ w-day 1)))))

(define date '(1 0 1900 0))

(define (format-date date)
  (list (get-day date)
	(get-month-name date)
	(get-year date)
	(get-week-day-name date)))

(get-day date)
(get-month date)
(get-year date)
(get-week-day-name date)
(leap? 1900)
(leap? 1901)
(leap? 1904)
(leap? 1905)
(leap? 2000)

(let loop ((count 1)
	   (date date))
  (when (< (get-year date) 2001)
      ;; (when (> x 0)
    (loop (if (and
	       (>= (get-year date) 1901)
	       (eq? (get-week-day-name date) 'Sunday)
	       (eq? (get-day date) 1))
	      (begin
		(format #t "count: ~a date:~a\n" count (format-date date))		
		(+ count 1))
	      count)
	  (next-date date))))
