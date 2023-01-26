; Este problema consiste en meter los regalos en cajas
(define (problem guardar)
 (:domain cajas)
 (:requirements :typing :equality :negative-preconditions)
 (:objects
    caja1 caja2 - caja 
    regalo1 regalo2 regalo3 regalo4 - regalo 
    )
 (:init
 ; Cajas, lugares que empiezan vacios
    (vacio caja1)
    (vacio caja2)
 ; Regalos, empiezan disponibles
    (disponible regalo1)
    (disponible regalo2)
    (disponible regalo3)
    (disponible regalo4)
 )
 (:goal (and (not (disponible regalo3)) (not(disponible regalo4)) ) )
)