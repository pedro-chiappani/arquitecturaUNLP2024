.data

CONTROL: .word32 0x10000
DATA: .word32 0x10008

negro: .byte 255, 0, 0, 0
pares: .word 1, 15, 5, 25, 20, 25, 5, 20, 35, 40, 49, 3, 13, 5, 17, 4

.code


daddi $sp, $0, 0x400

daddi $s0, $0, pares

dadd $a0, $0, $s0
daddi $a1, $0, 16
jal graficar
halt

graficar:   daddi $sp, $sp, -8
            sd $ra, 0($sp)
            dadd $t0, $0, $a1
            dadd $t1, $0, $a0
            lwu $t3, negro($0)
            ld $t4, CONTROL($0)
            ld $t5, DATA($0)
    sig:    ld $a0, 0($t1)
            daddi $t1, $t1, 8
            ld $a1, 0($t1)
            daddi $t1, $t1, 8
            jal diferencia
            sw $t3, 0($t5)
            sb $v0, 5($t5)
            sb $v0, 4($t5)
            daddi $t2, $0, 5
            sd $t2, 0($t4)
            daddi $t0, $t0, -2
            bnez $t0, sig
            ld $ra, 0($sp)
            daddi $sp, $sp, 8
            jr $ra


diferencia: slt $t6, $a0, $a1
            beqz $t6, mayor
            dsub $v0, $a1, $a0
            j vuelta
    mayor:  dsub $v0, $a0, $a1
    vuelta: jr $ra
