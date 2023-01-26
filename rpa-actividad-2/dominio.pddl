(define (domain paths-class)
  (:requirements :typing :equality :negative-preconditions :disjunctive-preconditions)
  (:types vehicle package location num)
  (:predicates
    (connected ?via1 - location ?via2 - location) ; via1 via2 are connected
    (in ?pack - package ?loc - location) ; pack is in loc
    (at ?veh - vehicle ?loc - location) ; veh is at loc
    (loaded ?pack - package ?veh - vehicle) ; pack is loaded in train
    (capacity ?veh - vehicle ?c - num) ; veh has capacity c
    (countForwards ?c1 - num ?c2 - num) ; count c2 comes after c1 
    (countBackwards ?c1 - num ?c2 - num) ; count c1 comes after c2

    ; (full ?loc - location) ; loc is full of its capacity (train or locations)
    ; (processed ?pack - package) ; pack is processed
    ; (package ?pack) ; pack is package
    ; (vehicle ?veh) ; veh is vehicle
  )
  (:action move ; move vehicle from loc1 to loc2 
                  ; if vehicle is in loc1 and 
                  ; if loc1 and loc2 are connected or if loc2 and loc 1 are connected and
                  ; if it's vehicle
    :parameters (
      ?veh - vehicle 
      ?loc1 ?loc2 - location)
    :precondition (or 
      (and 
        (at ?veh ?loc1) 
        (connected ?loc1 ?loc2) 
      )
      (and 
        (at ?veh ?loc1) 
        (connected ?loc2 ?loc1) 
      )
    )
    :effect (and 
        (at ?veh ?loc2)
        (not (at ?veh ?loc1))
    )
  )
  (:action load ; load pack on train with capacity c1 and next capacity c2 from loc 
                  ; if pack is in loc and 
                  ; if veh is at loc and
                  ; if pack is not processed and 
                  ; if veh is not full capacity trenCapacity4 and
                  ; if it is package
    :parameters (
      ?pack - package 
      ?veh - vehicle 
      ?loc - location
      ?c1 ?c2 - num
    )
    :precondition (and 
      (in ?pack ?loc) 
      (at ?veh ?loc)
      (countForwards ?c1 ?c2)
      (capacity ?veh ?c1)
    )
    :effect (and 
      (loaded ?pack ?veh)
      (not (in ?pack ?loc))
      (capacity ?veh ?c2)
      (not(capacity ?veh ?c1))
      ; TODO location is maybe empty decrease localtion capacity
    )
  )
  (:action drop ; drop pack on loc from veh with capacity c1 and next capacity c2
                ; if pack is in train and 
                ; if veh is at loc and
                ; if loc is not full capacity
                ; if veh is not capacity0
                ; if it is package
    :parameters (
      ?pack - package 
      ?veh - vehicle 
      ?loc - location
      ?c1 ?c2 - num
    )
    :precondition (and 
      (loaded ?pack ?veh) 
      (at ?veh ?loc) 
      (countBackwards ?c1 ?c2)
      (capacity ?veh ?c1)
      ; (not(processed ?pack))
      ; (not(full ?veh))
    )
    :effect (and 
      (in ?pack ?loc)
      (not (loaded ?pack ?veh))
      (capacity ?veh ?c2)
      (not (capacity ?veh ?c1))
    )
  )
  ; (:action increment ; adds one unit to vehicule capacity
  ;       :parameters (
  ;         ?veh - vehicle
  ;         ?c1 ?c2 - num
  ;       )
  ;       :precondition (and
  ;         (count ?c1 ?c2)
  ;       )
  ;       :effect (and 
  ;          (capacity ?veh ?c2)
  ;       )
  ;   )    
)
