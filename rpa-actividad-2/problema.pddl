(define (problem paths)
  (:domain paths-class)
  (:objects puerto - location 
    almacen - location
    fabrica1 fabrica2 - location 
    tren - vehicle 
    contenedor1 contenedor2 contenedor3 contenedor4 contenedor5 contenedor6 contenedor7 contenedor8 - package 
  )
  (:init
    (connected almacen puerto)
    ; (connected puerto fabrica1)
    ; (connected fabrica1 fabrica2)
    ; (connected fabrica2 almacen)
    ; (connected puerto almacen)
    ; (connected almacen fabrica2)
    ; (connected fabrica2 fabrica1)
    ; (connected fabrica1 puerto)
    (on contenedor1 puerto)
    ; (package contenedor1)
    ; (on contenedor2 puerto)
    ; (on contenedor3 puerto)
    ; (on contenedor4 puerto)
    ; (on contenedor5 puerto)
    ; (on contenedor6 puerto)
    ; (on contenedor7 puerto)
    ; (on contenedor8 puerto)
    ; (not(full fabrica1))
    ; (not(full fabrica2))
    ; (not(full almacen))
    (not(full tren))
    (on tren puerto)
    ; (vehicle tren)
    ; (not(processed contenedor1))
    ; (not (processed contenedor2))
    ; (not (processed contenedor3))
    ; (not (processed contenedor4))
    ; (not (processed contenedor5))
    ; (not (processed contenedor6))
    ; (not (processed contenedor7))
    ; (not (processed contenedor8))
  )
 (:goal 
  (on contenedor1 tren)
    ; (and 
    ;   (processed contenedor1)
    ;   (processed contenedor2)
    ;   (processed contenedor3)
    ;   (processed contenedor4)
    ;   (processed contenedor5)
    ;   (processed contenedor6)
    ;   (processed contenedor7)
    ;   (processed contenedor8)
    ;   (on contenedor1 almacen)
    ;   (on contenedor2 almacen)
    ;   (on contenedor3 almacen)
    ;   (on contenedor4 almacen)
    ;   (on contenedor5 almacen)
    ;   (on contenedor6 almacen)
    ;   (on contenedor7 almacen)
    ;   (on contenedor8 almacen)
    ; )
  )
)