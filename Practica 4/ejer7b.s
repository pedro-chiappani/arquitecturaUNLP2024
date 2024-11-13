        .data
V:      .space 80

        .code
        daddi $t0, $zero, 10
        dsll $t0, $t0, 3
        dadd $t3, $zero, $zero
        daddi $t1, $zero, 1
loop:   sd $t1, V($t3)
        daddi $t3, $t3, 8
        daddi $t1, $t1, 2
        slt $t2, $t3, $t0
        bnez $t2, loop
        halt
