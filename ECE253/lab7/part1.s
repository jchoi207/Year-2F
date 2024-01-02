.global _start
.text

_start:
	la s2, LIST # loading the address of s2 (first value) 
	addi s10, zero, 0 # sum term = 0 
	addi s11, zero, 0 # counter term = 0
LOOP:
	lw a0, 0(s2) # loading word first element of s2 into a0 
	# addi s9, zero, 0 # s9 
	blt a0, zero, END # branch lesser than: a0 < s9 = a0 < 0  
	add s10, s10, a0 # adding current term to sum s10 += a0
	addi s11, s11, 1 # incrementing counter
	addi s2, s2, 4 # move to the value of the next address (remember working in hex)
	j LOOP # jump back to LOOP label
	
END:
ebreak
	.global LIST
	.data
LIST:
#	.word 1, 2, 3, 5, 0xA, -1
	.word 1, 1, 1, 1, 1, -1