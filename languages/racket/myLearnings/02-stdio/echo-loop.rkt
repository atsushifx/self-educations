#lang racket

(define (main)
  ; type-of: get data type of obj
  (define (type-of obj)
    (cond
      [(number? obj)  "number"]
      [(string? obj)  "string"]
      [(boolean? obj) "boolean"]
      [(symbol? obj)  "symbol"]
      [(char? obj)    "character"]
      [(null? obj)    "empty list"]
      [(pair? obj)    (if (list? obj) "list" "pair")]
      [(vector? obj)  "vector"]
      [else           "unknown"]))

  ; input from stdio with echo back
  (define (echo-input)
    (display "input: ")
    (let
        ([in (read)])
      (display "output: ")
      (print in)
      (display (string-append "  -  "  (type-of in)))
      (newline)
      in
      )
    )

  (define (echo-loop)
    (let ([input (echo-input)])
      (unless (eof-object? input)
        (echo-loop))))

  ; main roution
  (displayln "--- echo ---")
  (echo-loop)

  )

(main)
