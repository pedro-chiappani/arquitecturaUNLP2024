.data
A: .word 2,1,3
SUM: .word 0
.code
daddi r2, r0, 0
ld r1, SUM(r0)
daddi r3, r0, 3
loop: ld r4, A(r2)
dadd r1,r1,r4
daddi r3,r3,-1
bnez r3,loop
sd r1, SUM(r0)
halt
