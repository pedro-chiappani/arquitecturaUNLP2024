        .data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
cant:   .word 0

        .code
        daddi $t0, $zero, 64
        daddi $t1, $zero, 91
        dadd $t2, $zero, $zero
        dadd $t5, $zero, $zero
loop:   lbu $t3, cadena($t2)
        beqz $t3, fin
        slt $t4, $t0, $t3
        beqz $t4, sig
        slt $t4, $t3, $t1
        beqz $t4, sig
        daddi $t5, $t5, 1
sig:    daddi $t2, $t2, 1
        j loop
fin:    sd $t5, cant($zero)
        halt
