        .data
F:      .word 1

        .code
main:   ld $t0, F($zero) ; F en $t1
        daddi $t1, $zero, 1 ; $t0 = 1
        daddi $t2, $zero, 4; $t1 = 4
loop:   dmul $t0, $t0, $t1 ;
        daddi $t1, $t1, 1; $t1 = $t1 + 1
        bne $t1, $t2, loop
        dmul $t0, $t0, $t1 ;
        sd $t0, F($zero) ; resultado en F
        halt
