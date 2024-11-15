        .data
texto:  .asciiz "Este es el texto"
L:      .word 0

        .code
        daddi $a0, $0, texto
        jal longitud
        sd $v0, L($0)
        halt

longitud:   daddi $v0, $0, 0
sigue:      lb $t0, 0($a0)
            beqz $t0, fin
            daddi $v0, $v0, 1
            daddi $a0, $a0, 1
            j sigue
fin:        jr $ra
