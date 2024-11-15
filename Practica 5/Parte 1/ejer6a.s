        .data
N:      .word 4
R:      .word 0

        .code
        ld $a0, N($0)
        jal factorial
        sd $v0, R($0)
        halt

factorial:  daddi $v0, $0, 1
sigue:      beqz $a0, fin
            dmul $v0, $v0, $a0
            daddi $a0, $a0, -1
            j sigue
fin:        jr $ra
