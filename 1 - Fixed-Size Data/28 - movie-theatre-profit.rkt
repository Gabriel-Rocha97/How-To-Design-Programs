;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28 - movie-theatre-profit|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; constants
(define TICKET-PRICE-DEFAULT 5)
(define ATTENDEED-DEFAULT 120)
(define PRICE-CHANGE 0.1)
(define ATTENDEED-CHANGE 15)
(define FIXED-COST 180)
(define VARIABLE-COST 0.04)

; functions
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (attendees ticket-price)
  (- ATTENDEED-DEFAULT (* (- ticket-price TICKET-PRICE-DEFAULT) (/ ATTENDEED-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST (attendees ticket-price))))

;; Potencials profits for:
(profit 1)    ;; 511.2
(profit 2)    ;; 937.2 
(profit 3)    ;; 1063.2
(profit 4)    ;; 889.2
(profit 5)    ;; 415.2

;; The best ticket price who maximize the profit: $3.