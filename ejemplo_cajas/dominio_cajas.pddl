; Dominio de ejemplo para mostrar como contar objetos
; Intentad usar siempre tipos (aqui no se usan)
(define (domain cajas)
    (:requirements :typing :equality :negative-preconditions)
    ; Hay que declarar los tipos
    (:types
        default_object 
        caja - lugar
        regalo - guardable
    )
    (:constants vacio)
    (:predicates
       (contiene ?lugar - lugar ?objeto - guardable) ; el lugar contiene el objeto
       (disponible ?objeto - guardable) ; El valor v2 es el siguiente al valor v1
       (vacio ?lugar - lugar) ; El lugar esta vacio
    )
    (:action guardar
    ; Anyade una unidad al contador
        :parameters (?lugar - lugar
                     ?objeto - guardable
        )
        :precondition (and (disponible ?objeto) (vacio ?lugar))
        :effect (and 
           (contiene ?lugar ?objeto)
           (not (disponible ?objeto) )
           (not  (vacio ?lugar) )
        )
    )    
)