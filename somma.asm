#immetere una stringa di numeri e calcolare la loro somma 

.data
	msg_input: .asciz "Inserisci il numero: "
	msg_output: .asciz " La somma è: "
	numeri: .space 32
.text
.globl main
main:
	la a0, msg_input
	li a7,4
	ecall
	
	li a7,8 
	la a0,numeri
	li a1,32
	ecall
	
	jal compute_sum
	mv t0,a0
	
	la a0, msg_output
	li a7,4
	ecall
	mv a0,t0
	li a7,1
	ecall
	
	li a7,1
	li a7,10
	ecall
	
	compute_sum:
		li t2,0
		
		loop:
			lbu t0,0(a0)
			beq t0,zero,fine_sum
			li t1, 10
			beq t0,t1,fine_sum
			
			addi t0,t0,-48
			add t2, t2,t0
			
			addi a0,a0,1
			j loop
		fine_sum:
			mv a0,t2
			ret