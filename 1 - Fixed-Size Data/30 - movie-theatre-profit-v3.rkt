;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30 - movie-theatre-profit-v3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; constants
(define TICKET-PRICE-DEFAULT 5)
(define ATTENDEED-DEFAULT 120)
(define PRICE/ATTENDEE 150)
(define VARIABLE-COST 1.50)

; functions
(define (profit.v3 ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (attendees ticket-price)
  (- ATTENDEED-DEFAULT (* (- ticket-price TICKET-PRICE-DEFAULT) PRICE/ATTENDEE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* VARIABLE-COST (attendees ticket-price)))

(profit.v3 3)    ;; 630
(profit.v3 4)    ;; 675
(profit.v3 5)    ;; 420