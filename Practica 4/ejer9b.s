        .data
cadena: .asciiz "adbdcdedfdgdhdid" # cadena a analizar
car:    .ascii "d" # carácter buscado
cant:   .word 0 # cantidad de veces que se repite el carácter car en cadena.

        .code
        ld $t0, car($zero)
        dadd $t1, $zero, $zero
        dadd $t2, $zero, $zero
loop:   lbu $t3, cadena($t1)
        bne $t3, $t0, else
        daddi $t2, $t2, 1
else:   daddi $t1, $t1, 1
        bnez $t3, loop
        sd $t2, cant($zero)
        halt
