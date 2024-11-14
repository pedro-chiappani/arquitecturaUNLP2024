        .data
V:      .word32 1, 2, 3
R:      .word 3
D:      .word 0

        .code
        dadd $t0, $zero, $zero
        dadd $t2, $zero, $zero
        dadd $t4, $zero, $zero
        ld $t4, R($zero)
        dsll $t4, $t4, 2
loop:   lw $t1, V($t0)
        dadd $t2, $t2, $t1
        daddi $t0, $t0, 4
        slt $t3, $t0, $t4
        bnez $t3, loop
        sd $t2, D($zero)
        halt
