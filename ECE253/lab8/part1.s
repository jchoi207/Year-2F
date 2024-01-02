.global _start
.text
_start:
    addi s10, zero, 0 
    la a1, LIST
LOOP:
    lw a0, 0(a1)
    addi a1, a1, 4
    bltz a0, END
    jal ONES
    ble a0, s10, L_END
    addi s10, a0, 0
L_END:
    j LOOP
ONES:
    addi s4, a0, 0
    addi a0, zero, 0 
O_LOOP:
    beqz s4, E_ONES 
    srli s2, s4, 1 
    and s4, s4, s2
    addi a0, a0, 1 
    j O_LOOP
E_ONES:
    jr ra
END:
    ebreak
.global LIST
.data
LIST:
    .word 0x000F0027, 0x00000000, 0x00000010, 0x80000002, 0x00000000, -1    
