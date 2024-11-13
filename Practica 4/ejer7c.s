        .data
V:      .space 80

        .code
        daddi $t0, $zero, 9
        dsll $t0, $t0, 3
        dadd $t3, $zero, $zero
        dadd $t1, $zero, $zero
        daddi $t4, $zero, 1
        sd $t1, V($t3)
        daddi $t3, $t3, 8
loop:   sd $t4, V($t3)
        daddi $t3, $t3, 8
        dadd $t5, $zero, $t4
        dadd $t4, $t1, $t4
        dadd $t1, $zero, $t5
        slt $t2, $t3, $t0
        bnez $t2, loop
        halt
