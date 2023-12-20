;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pictures-of-ufo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; How would you change the program to create a 200-by-400 scene?
; How would you change the program so that it depicts the landing of a green UFO (unidentified flying object)? 
; How would you change the program so that the background is always blue?
; How would you change the program so that the rocket lands on a flat rock bed that is 10 pixels higher than the bottom of the scene? Don’t forget to change the scenery, too.


;constants
(define HEIGHT 400)
(define WIDTH 200)

(define UFO (overlay
             (circle 10 "solid" "green")
             (rectangle 40 4 "solid" "green")))


(define X-UFO (/ WIDTH 2))

(define ROCK-BED (rectangle 30 10 "solid" "grey"))
(define Y-ROCK (- HEIGHT (/ (image-height ROCK-BED) 2)))

(define UFO-CENTER-TO-TOP
  (- HEIGHT (/ (image-height UFO) 2) (image-height ROCK-BED)))

(define MTSCN
  (place-image ROCK-BED X-UFO Y-ROCK (rectangle WIDTH HEIGHT "solid" "blue")))


;function
(define (picture-of-ufo h)
  (cond
    [(< h UFO-CENTER-TO-TOP)
     (place-image UFO X-UFO h MTSCN)]
    [(>= h UFO-CENTER-TO-TOP)
     (place-image UFO X-UFO UFO-CENTER-TO-TOP MTSCN)]))