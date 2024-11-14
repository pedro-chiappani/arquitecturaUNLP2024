        .data
cadena: .asciiz ""

        .code
        dadd $t0, $zero, $zero
        daddi $t2, $zero, 1
        daddi $t3, $zero, 0x61
        dadd $t4, $zero, $zero
        daddi $t5, $zero, 0x69
loop:   sb $t3, cadena($t0)
        daddi $t0, $t0, 1
        daddi $t4, $t4, 1
        bne $t4, $t2, loop
        dadd $t4, $zero, $zero
        daddi $t3, $t3, 1
        daddi $t2, $t2, 1
        bne $t3, $t5, loop
        halt
