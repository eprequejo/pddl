(define (domain rutas-clase)
    (:requirements :typing :equality :negative-preconditions)
    (:predicates
       (conectado ?x ?y)
       (en ?x ?y)
    )
    (:action mover
        :parameters (?obj ?x ?y)
        :precondition (and (en ?obj ?x) (conectado ?x ?y))
        :effect (and 
           (en ?obj ?y)
           (not (en ?obj ?x))
        )
    )
)

