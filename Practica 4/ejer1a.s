        .data
A:      .word 10
B:      .word 8
S:      .word 0
P:      .word 0
D:      .word 0

        .text
main:   ld r4, A(r0) ; A en r4
        ld r5, B(r0) ; B en r5
        dadd r3, r4, r5 ; r3 = r4+r5
        sd r3, S(r0) ; resultado en C
        dmul r3, r4, r5 ; r3 = r4*r5
        daddi r3, r3, 2 ; r3 = r3+2
        sd r3, P(r0) ; resultado en S
        dmul r3, r4, r4 ; r3 = r4*r4
        ddiv r3, r3, r5 ; r3 = r3/r5
        sd r3, D(r0) ; resultado en D
        halt
