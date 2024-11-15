        .data
texto:  .asciiz "Este es el texto"
letra:  .ascii "l"
R:      .word 0

        .code
        daddi $a0, $0, texto
        ld $a1, letra($0)
        jal contiene
        sd $v0, R($0)
        halt

contiene:  daddi $v0, $0, 0
sigue:      lb $t0, 0($a0)
            beqz $t0, fin
            beq $t0, $a1, encontrado
            daddi $a0, $a0, 1
            j sigue
encontrado: daddi $v0, $0, 1
fin:        jr $ra
