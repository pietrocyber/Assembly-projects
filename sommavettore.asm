# scrivere la somma degli array e stamparli a video

.globl start

.data
 vettore: .word -3, -2, 12, 1, 5, 2,8, 5, 7, -5
 size: .word 10
 result: .word 0
  
.text
start:
	la t4, size
  	la t5, vettore
  	
  	lw t0, 0(t4)
  	li t1, 0
ciclo:
	lw t2, 0(t5)
	add t1,t1,t2
	addi t0,t0,-1
	addi t5,t5, 4
	
	bne zero, t0,ciclo
	
store:
	la t3,result 
	sw t1,0(t3)
end:
	li a7, 1
	mv a0,t1
	ecall 
	
	li a7,10
	ecall