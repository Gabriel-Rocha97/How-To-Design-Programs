;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |39|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; physical constants:
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define CAR-BOTTOM-WIDTH (* WHEEL-RADIUS 10))
(define CAR-HEIGHT (* WHEEL-RADIUS 2))
(define WHEEL-SPACE-CAR (- 0 CAR-HEIGHT))

; graphical constants:
; wheels
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle  WHEEL-DISTANCE 0 "solid" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

; car body
(define CAR-TOP
  (rectangle WHEEL-DISTANCE CAR-HEIGHT "solid" "red"))
(define CAR-BOTTOM
  (rectangle CAR-BOTTOM-WIDTH CAR-HEIGHT "solid" "red"))
(define CAR-BODY
  (overlay/offset CAR-TOP 0 WHEEL-RADIUS CAR-BOTTOM))

; car
(define CAR
  (overlay/offset BOTH-WHEELS  0 WHEEL-SPACE-CAR  CAR-BODY))
