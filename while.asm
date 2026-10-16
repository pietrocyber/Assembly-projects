.globl start
.text

start:
	li t0, 8
	li t1, 1
	li t2, 0
	li t3,1
	
ciclo:
	beq zero,t0, end
	add t1,t2,t3
	addi t2,t3,0
	addi t3, t1,0
	addi t0,t0,-1
	j ciclo
end:
	li a7,10
	ecall
