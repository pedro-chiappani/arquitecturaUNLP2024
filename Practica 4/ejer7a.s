        .data
V:      .word 17, 21, -13, 6, 45, 10, -15, -21, 28, 36
L:      .word 10
POS:    .space 8
MAX:    .space 8
F:      .space 80

        .code
        dadd $t0, $zero, $zero
        dadd $t2, $zero, $zero ; uso t2 para POS
        dadd $t3, $zero, $zero ; uso t3 para MAX
        ld $t4, L($zero)
        dsll $t4, $t4, 3
loop:   ld $t1, V($t0)
        slt $t5, $zero, $t1
        beq $t5, $zero, else
        daddi $t2, $t2, 1
else:   slt $t5, $t3, $t1
        beq $t5, $zero, else2
        dadd $t3, $zero, $t1
else2:  dadd $t1, $t1, $t1
        sd $t1, F($t0)
        daddi $t0, $t0, 8
        slt $t5, $t0, $t4
        bnez $t5, loop
        sd $t2, POS($zero)
        sd $t3, MAX($zero)
        halt

