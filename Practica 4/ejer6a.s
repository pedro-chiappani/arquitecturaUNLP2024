        .data
V:      .word 1, 2, 1
R:      .word 0

        .code
        dadd $t0, $zero, $zero
        ld $t1, V($t0)
        daddi $t0, $t0, 8
        ld $t2, V($t0)
        daddi $t0, $t0, 8
        ld $t3, V($t0)
        dadd $t4, $t1, $t2
        dadd $t4, $t4, $t3
        sd $t4, R($zero)
        halt
