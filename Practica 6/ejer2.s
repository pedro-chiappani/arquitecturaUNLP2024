    .data
A:  .word 1
B:  .word 2

    .code
    ld $t0, A($zero)
    ld $t1, B($zero)
    sd $t1, A($zero)
    sd $t0, B($zero)
    halt
