#risoluzione di un esercizio di fibonacci

.globl _start
.data:
		num: .dword 5
		
.text
_start:
	la a0,num 
	ld a0,0(a0)
	jal ra, fib
	
	#exit
	li a7, 10
	ecall
	
fib:
	beq a0,zero,fine
	li t1,1 
	beq a0,t1,fine2
	
	addi sp,sp,-16
	sd ra,0(sp)
	sd a0,8(sp)
	
	sub a0,a0,t1
	jal fib
	addi t2,a0,0
	
	ld a0,8(sp)
	ld ra, 0(sp)
	addi sp,sp,16
	
	addi sp,sp,-24
	sd ra,0(sp)
	sd a0,8(sp)
	sd t2,16(sp)
	
	li t3,2
	sub a0,a0,t3
	jal fib
	addi t4,a0,0
	
	ld ra,0(sp)
	ld a0, 8(sp)
	ld t2,16(sp)
	addi sp,sp,24
	
	add a0,t2,t4
	jr ra
fine:
	li a0,0
	jr ra
fine2:
	li a0,1
	jr ra