            .data
CONTROL:    .word 0x010000
DATA:       .word 0x010008
texto1:      .asciiz "Ingrese una clave de 4 caracteres ("
texto2:      .asciiz " intentos): "
correcta:   .asciiz "Clave correcta: acceso permitido"
incorrecta: .asciiz "Clave incorrecta"
clave:      .ascii "cabj"
input:      .space 4
LF:         .byte 0x0A

            .code
            ld $t0, CONTROL($zero)
            ld $t1, DATA($zero)
            daddi $t7, $zero, 5

    inicio: daddi $t2, $zero, texto1
            sd $t2, 0($t1)
            daddi $t2, $zero, 4
            sd $t2, 0($t0)
            dadd $t2, $t7, $zero
            sd $t2, 0($t1)
            daddi $t2, $zero, 1
            sd $t2, 0($t0)
            daddi $t2, $zero, texto2
            sd $t2, 0($t1)
            daddi $t2, $zero, 4
            sd $t2, 0($t0)

            daddi $t4, $zero, input
            daddi $t6, $zero, 4
    loop:   daddi $t2, $zero, 9
            sd $t2, 0($t0)
            lbu $t5, 0($t1)
            sb $t5, 0($t4)
            daddi $t6, $t6, -1
            bnez $t6, loop

            daddi $t2, $zero, 4
            daddi $t5, $zero, 0 # offset indice del caracter actual
loopCheck:  daddi $t3, $t5, clave
            daddi $t4, $t5, input
            lbu $t6, 0($t3)
            lbu $t7, 0($t4)
            bne $t6, $t7, no
            daddi $t2, $t2, -1
            beqz $t2, exitCheck
            daddi $t5, $t5, 1 # incremento offset para verificar el siguiente carcter
            j loopCheck

exitCheck:  daddi $t2, $zero, correcta
            sd $t2, 0($t1)
            daddi $t3, $zero, 4
            sd $t3, 0($t0)
            j fin

no:         daddi $t2, $zero, incorrecta
            sd $t2, 0($t1)
            daddi $t2, $zero, 4
            sd $t2, 0($t0)
            daddi $t2, $zero, LF
            sd $t2, 0($t1)
            daddi $t2, $zero, 4
            sd $t2, 0($t0)
            daddi $t7, $t7, -1
            bnez $t7, inicio

fin:        halt
