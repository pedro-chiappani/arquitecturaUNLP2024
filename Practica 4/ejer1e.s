        .data
A:      .word 2
B:      .word 0

        .code
        ld $t0, A($zero)
        andi $t1, $t0, 1
        beqz $t1, par
        daddi $t2, $zero, 1
        j fin
par:    daddi $t2, $zero, 0
fin:    sd $t2, B($zero)
        halt
