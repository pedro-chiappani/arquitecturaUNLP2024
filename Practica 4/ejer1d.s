        .data
L:      .word 0

        .code
        daddi $t1, $zero, 20 ;
        daddi $t3, $zero, 2 ; $t3 = 2
loop:   slti $t2, $t1, 1 ;
        bnez $t2, fin;
        ddiv $t1, $t1, $t3;
        daddi $t0, $t0, 1;
        j loop;
fin:    sd $t0, L($zero) ; resultado en L
        halt

