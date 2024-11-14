        .data
V:      .word 2, 3, 4
L:      .word 3
R:      .word 0

        .code
        daddi $t2, $zero, V
        dadd $t1, $zero, $zero
        ld $t3, L($zero)
        dsll $t3, $t3, 3
loop:   ld $t4, 0($t2)
        dadd $t1, $t1, $t4
        daddi $t2, $t2, 8
        slt $t0, $t2, $t3
        bnez $t0, loop
        sd $t1, R($zero)
        halt
