.global _start
.text
_start:
    la s2, LIST
    lw s3, 0(s2)
    addi s2, s2, 4
    addi s5, zero, 1
    
BUBBLE_S:
    addi s3, s3, -1
    bltz s3, END
    beqz s5, END
    addi s5, zero, 0
    addi s4, zero, 0
    add s6, s2, zero
BS_LOOP:
    bge s4, s3, BUBBLE_S
    addi a0, s6, 0
    jal SWAP
    beqz a0, BL_END
    addi s5, zero, 1
BL_END:
    addi s4, s4, 1
    addi s6, s6, 4
    j BS_LOOP
    
SWAP:
    mv  t5, a0
    addi a0, zero, 0
    lw t3, 0(t5)
    lw t4, 4(t5)
    blt t3, t4, SWAP_RETURN
    sw t3, 4(t5)
    sw t4, 0(t5)
    addi a0, zero, 1
SWAP_RETURN:
    jr ra

END:
    ebreak
.global LIST
.data
LIST:
    .word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33
