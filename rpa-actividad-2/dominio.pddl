(define (domain paths-class)
  (:requirements :typing :equality :negative-preconditions :disjunctive-preconditions)
  (:types vehicle package location)
  (:predicates
    (connected ?via1 ?via2) ; via1 via2 are connected
    (on ?pack ?loc) ; pack is on loc
    (full ?loc) ; loc is full of its capacity (train or locations)
    (processed ?pack) ; pack is processed
    ; (package ?pack) ; pack is package
    ; (vehicle ?veh) ; veh is vehicle
  )
    ; (:action move ; move pack from loc1 to loc2 
    ;               ; if pack is in loc1 and 
    ;               ; if loc1 and loc2 are connected or if loc2 and loc 1 are connected
    ;   :parameters (?obj ?x ?y)
    ;   :precondition (and (on ?obj ?x) (connected ?x ?y) (or(connected ?y ?x)))
    ;   :effect (and 
    ;       (on ?obj ?y)
    ;       (not (on ?obj ?x))
    ;   )
    ; )
    (:action load ; load pack on train from loc 
                    ; if pack is on loc and 
                    ; if veh is loc and
                    ; if pack is not processed and 
                    ; veh is not full and
                    ; is package
      :parameters (
        ?pack - package 
        ?veh - vehicle 
        ?loc)
      :precondition (and 
          (on ?pack ?loc) 
          (on ?veh ?loc) 
          ; (not(processed ?pack))
          (not(full ?veh))
      )
      :effect (and 
          (on ?pack ?veh)
          (not (on ?pack ?loc))
          ; location is maybe empty
      )
    )
)