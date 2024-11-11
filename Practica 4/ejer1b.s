        .data
A:      .word 5
B:      .word 8
C:      .word 0

        .text
main:   ld $t0, A($zero) ; A en r4
        ld $t1, B($zero) ; B en r5
        beqz $t0, cero; si A=0 salta a cero
        slt $t2, $t0, $t1 ; $t2 = A<B
        bnez $t2, menor ; si A<B salta a menor
        dadd $t3, $t0, $t0 ; r3 = A*2
        j fin
menor:  dadd $t3, $t1, $zero ; r3 = B
        j fin
cero:   daddi $t3, $t3, 0 ; r3 = 0
fin:    sd $t3, C($zero) ; resultado en C
        halt
