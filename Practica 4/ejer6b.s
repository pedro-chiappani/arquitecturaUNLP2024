        .data
V:      .word 1, 2, 1
R:      .word 3

        .code
        dadd $t0, $zero, $zero
        dadd $t2, $zero, $zero
        dadd $t4, $zero, $zero
        ld $t4, R($zero)
        dsll $t4, $t4, 3
loop:   ld $t1, V($t0)
        dadd $t2, $t2, $t1
        daddi $t0, $t0, 8
        slt $t3, $t0, $t4
        bnez $t3, loop
        sd $t2, R($zero)
        halt
