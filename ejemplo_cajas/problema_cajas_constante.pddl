; Este problema consiste en meter los regalos en cajas
(define (problem guardar)
 (:domain cajas-constante)
 (:objects
    caja1 caja2 - caja
    regalo1 regalo2 regalo3 regalo4 - regalo
    )
 (:init
 ; Cajas, lugares que empiezan vacios
    (contiene caja1 vacio)
    (contiene caja2 vacio)
 ; Regalos, empiezan disponibles
    (disponible regalo1)
    (disponible regalo2)
    (disponible regalo3)
    (disponible regalo4)
 )
 (:goal (and (not (disponible regalo3) ) (not (disponible regalo4) )  ) )
)