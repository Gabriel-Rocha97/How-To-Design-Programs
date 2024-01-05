;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |41 - tree-stop-added|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; physical constants:
(define WIDTH-OF-WORLD 200)


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

;tree
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))


(define SCENE (empty-scene WIDTH-OF-WORLD (* WHEEL-RADIUS 8)))
(define Y-CAR (- (image-height SCENE) (/ (image-height CAR) 2)))
(define Y-TREE (- (image-height SCENE) (/ (image-height TREE) 2)))
(define BACKGROUND (place-image TREE 20 Y-TREE SCENE))
(define END-WORLD (+ (image-width BACKGROUND) (/ (image-width CAR) 2)))

;------------------------------------------------------------------------------

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car


; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))


; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(check-expect (render 50)
              (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 100)
              (place-image CAR 100 Y-CAR BACKGROUND))
(check-expect (render 150)
              (place-image CAR 150 Y-CAR BACKGROUND))
(check-expect (render 200)
              (place-image CAR 200 Y-CAR BACKGROUND))
(define (render cw)
   (place-image CAR cw Y-CAR BACKGROUND))


; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
(check-expect (tock 21) 24)
(check-expect (tock 78) 81)
; (check-expect (tock 200) 201) test failed.
(define (tock cw)
  (+ cw 3))


; WorldState -> Boolean
; evaluate (end ? cw) after every event
(check-expect (end? 220) #false)
(check-expect (end? 225) #false)
(check-expect (end? 226) #true)
(define (end? cw)
  (> cw END-WORLD))
