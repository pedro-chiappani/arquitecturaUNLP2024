        .data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
L:      .word 0

        .code
        dadd $t0, $zero, $zero
        dadd $t2, $zero, $zero
loop:   lbu $t1, cadena($t0)
        beqz $t1, fin
        daddi $t0, $t0, 1
        daddi $t2, $t2, 1
        j loop
fin:    sd $t2, L($zero)
        halt
