        .data
texto:  .asciiz "Este es el texto"
vocales:.ascii "aeiou"
R:      .word 0

        .code
        daddi $a0, $0, texto
        daddi $a1, $0, voales
        jal contiene
        sd $v0, R($0)
        halt

contiene:  daddi $v0, $0, 0
sigue:      lb $t0, 0($a0)
            beqz $t0, fin
            dadd $t2, $0, $0
sigVoc:     lb $t1, $a1($t2)
            beq $t0, $a1, encontrado
            daddi $a1, $a1, 1
            j sigVoc
            j sigue
encontrado: daddi $v0, $0, 1
fin:        jr $ra
