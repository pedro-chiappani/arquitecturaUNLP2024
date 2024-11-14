            .data
texto:      .asciiz "Hola, Mundo!" ; El mensaje a mostrar
CONTROL:    .word 0x010000
DATA:       .word 0x010008

        .code
        ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
        ld $t1, DATA($zero) ; $t1 = dirección de DATA
        daddi $t2, $zero, texto ; $t2 = dirección del mensaje a mostrar
        sd $t2, 0($t1) ; DATA recibe el puntero al comienzo del mensaje
        daddi $t2, $zero, 4 ; $t2 = 4 función 4 salida de una cadena ASCII
        sd $t2, 0($t0) ; CONTROL recibe 4 y produce la salida del mensaje
        halt

# En t0 queda el valor 01000 que es la direccion de CONTROL
# En t1 queda el valor 01008 que es la direccion de DATA
