(define (domain paths-class)
  (:requirements :typing :equality :negative-preconditions :disjunctive-preconditions)
  (:types vehicle package location numVeh numLoc)
  (:predicates
    (connected ?via1 - location ?via2 - location) ; via1 via2 are connected
    (in ?pack - package ?loc - location) ; pack is in loc
    (at ?veh - vehicle ?loc - location) ; veh is at loc
    (loaded ?pack - package ?veh - vehicle) ; pack is loaded in train
    (capacityVeh ?veh - vehicle ?c - numVeh) ; veh has capacity c
    (capacityLoc ?loc - location ?c - numLoc) ; location has capacity c
    (countVeh ?c1 - numVeh ?c2 - numVeh) ; count c2 comes after c1 
    (countLoc ?c1 - numLoc ?c2 - numLoc) ; count c2 comes after c1 
    (maxCapacityVeh ?veh - vehicle ?c - numVeh) ; vehicle has max capacity of c
    (maxCapacityLoc ?loc - location ?c - numLoc) ; location has max capacity of c
    (isPort ?loc - location) ; loc is port

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
  (:action loadFromPort ; load pack on train from port taking into account train capacity (vehC1, vehC2)
                        ; if pack is in loc and 
                        ; if veh is at loc and
                        ; if pack is not processed and 
                        ; if veh is not full capacity capacity4 and
                        ; if it is package
                        ; if location is port
    :parameters (
      ?pack - package 
      ?veh - vehicle 
      ?loc - location
      ?vehC1 ?vehC2 - numVeh
    )
    :precondition (and 
      (in ?pack ?loc) 
      (at ?veh ?loc)
      (countVeh ?vehC1 ?vehC2)
      (capacityVeh ?veh ?vehC1)
      (isPort ?loc)
    )
    :effect (and 
      (loaded ?pack ?veh)
      (not (in ?pack ?loc))
      (capacityVeh ?veh ?vehC2)
      (not(capacityVeh ?veh ?vehC1))
    )
  )
  (:action loadFromLocation ; load pack on train taking from loc into account train capacity (vehC1, vehC2) and location capacity (locC1, locC2)
                ; if pack is in loc and 
                ; if veh is at loc and
                ; if pack is not processed and 
                ; if veh is not full capacity capacity4 and
                ; if it is package
    :parameters (
      ?pack - package 
      ?veh - vehicle 
      ?loc - location
      ?vehC1 ?vehC2 - numVeh
      ?locC1 ?locC2 - numLoc
    )
    :precondition (and 
      (in ?pack ?loc) 
      (at ?veh ?loc)
      (countVeh ?vehC1 ?vehC2)
      (capacityVeh ?veh ?vehC1)
      (countLoc ?locC1 ?locC2)
      (not(isPort ?loc))
      (capacityLoc ?loc ?locC2)
    )
    :effect (and 
      (loaded ?pack ?veh)
      (not (in ?pack ?loc))
      (capacityVeh ?veh ?vehC2)
      (not(capacityVeh ?veh ?vehC1))
      (capacityLoc ?loc ?locC1)
      (not (capacityLoc ?loc ?locC2))
    )
  )
  (:action drop ; drop pack on loc from veh taking into account train capacity (vehC1, vehC2) and location capacity (locC1, locC2)
                ; if pack is in train and 
                ; if veh is at loc and
                ; if loc is not full capacity
                ; if veh is not capacity0
                ; if it is package
    :parameters (
      ?pack - package 
      ?veh - vehicle 
      ?loc - location
      ?vehC1 ?vehC2 - numVeh
      ?locC1 ?locC2 - numLoc
    )
    :precondition (and 
      (loaded ?pack ?veh) 
      (at ?veh ?loc) 
      (countVeh ?vehC1 ?vehC2)
      (capacityVeh ?veh ?vehC2)
      (countLoc ?locC1 ?locC2)
      (capacityLoc ?loc ?locC1)
      (not(isPort ?loc))
      (not(maxCapacityLoc ?loc ?locC1))
      ; (not(maxCapacityLoc ?loc ?locC2))
      ; (not(processed ?pack))
    )
    :effect (and 
      (in ?pack ?loc)
      (not (loaded ?pack ?veh))
      (capacityVeh ?veh ?vehC1)
      (not (capacityVeh ?veh ?vehC2))
      (capacityLoc ?loc ?locC2)
      (not(capacityLoc ?loc ?locC1))
    )
  )

)
