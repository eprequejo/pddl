(define (problem rutas)
 (:domain rutas-clase)
 (:objects coche ciudad1 ciudad2)
 (:init
    (conectado ciudad1 ciudad2)
    (conectado ciudad2 ciudad1)
    (en coche ciudad1)
 )
 (:goal (and (en coche ciudad2)))
)