        .data
M:      .word 1
N:      .word 3
R:      .word 0

        .code
        daddi $sp, $0, 0x400
        ld $a0, N($0)
        ld $a1, M($0)
        jal comb
        sd $v0, R($0)
        halt

comb:   daddi $sp, $sp, -8
        sd $ra, 0($sp)
        dsub $t0, $a0, $a1 ; t0 = N - M
        jal factorial
        dadd $t1, $v0, $0 ; t1 = N!
        dadd $a0, $0, $a1
        jal factorial
        dadd $t2, $v0, $0 ; t2 = M!
        dadd $a0, $0, $t0
        jal factorial
        dmul $t0, $t2, $v0 ; t0 = M! * (N - M)!
        ddiv $v0, $t1, $t0 ; v0 = N! / (N! * (N - M)!)
        ld $ra, 0($sp)
        daddi $sp, $sp, 8
        jr $ra

factorial:  daddi $v0, $0, 1
sigue:      beqz $a0, fin
            dmul $v0, $v0, $a0
            daddi $a0, $a0, -1
            j sigue
fin:        jr $ra
