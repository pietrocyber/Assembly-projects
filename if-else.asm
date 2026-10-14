#if-else

.globl start
.text

start:
	li t0,10
	li t1,8

	addi t0,t0,-2
	add t0,t0,t1
	bge t0,zero, condizione
	addi t0,t0,1
	
condizione:
	addi t1,t1,1
	
end:
	li a7,10
	ecall