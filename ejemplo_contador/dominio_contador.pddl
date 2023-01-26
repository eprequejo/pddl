; Dominio de ejemplo para mostrar como contar objetos
; Ilustra tambien el uso de los tipos
(define (domain contar)
    (:requirements :typing :equality :negative-preconditions)
    ; Hay que declarar los tipos
    (:types contador numero)
    (:predicates
       (contador ?nombre - contador ?valor - numero) ; El contador con ese nombre tiene el valor indicado
       (siguiente ?v1 - numero ?v2 - numero) ; El valor v2 es el siguiente al valor v1
    )
    (:action incrementar
    ; Anyade una unidad al contador
        :parameters (?nombre - contador
                     ?v1 ?v2 - numero
        )
        :precondition (and (contador ?nombre ?v1) (siguiente ?v1 ?v2))
        :effect (and 
           (contador ?nombre ?v2)
           (not (contador ?nombre ?v1) )
        )
    )    
)