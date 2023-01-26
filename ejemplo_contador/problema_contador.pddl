(define (problem contar_10)
 (:domain contar)
 (:objects 
    contador1 - contador
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - numero
    )
 (:init
 ; Contadores
    (contador contador1 n0)
 ; Numeros
    (siguiente n0 n1)
    (siguiente n1 n2)
    (siguiente n2 n3)
    (siguiente n3 n4)
    (siguiente n4 n5)
    (siguiente n5 n6)
    (siguiente n6 n7)
    (siguiente n7 n8)
    (siguiente n8 n9)
    (siguiente n9 n10)
 )
 (:goal (contador contador1 n10) )
)