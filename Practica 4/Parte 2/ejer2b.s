            .data
CONTROL:    .word 0x010000
DATA:       .word 0x010008
texto:      .asciiz "Ingrese una clave de 4 caracteres: "
correcta:   .asciiz "Clave correcta: acceso permitido"
incorrecta: .asciiz "Clave incorrecta"
clave:      .asciiz "1011"
LF:         .byte 0x0A

        .code
        ld $t0, CONTROL($zero)
        ld $t1, DATA($zero)
loop:   daddi $t2, $zero, texto
        sd $t2, 0($t1)
        daddi $t2, $zero, 4
        sd $t2, 0($t0)
        daddi $t2, $zero, LF
        sd $t2, 0($t1)
        daddi $t2, $zero, 4
        sd $t2, 0($t0)
        daddi $t2, $zero, 9
        sd $t2, 0($t0)
        ld $t3, 0($t1)
        ld $t4, clave($zero)
        beq $t3, $t4, si
        daddi $t2, $zero, incorrecta
        sd $t2, 0($t1)
        daddi $t2, $zero, 4
        sd $t2, 0($t0)
        daddi $t2, $zero, LF
        sd $t2, 0($t1)
        daddi $t2, $zero, 4
        sd $t2, 0($t0)
        j loop
si:     daddi $t2, $zero, correcta
fin:    sd $t2, 0($t1)
        daddi $t2, $zero, 4
        sd $t2, 0($t0)
        halt
