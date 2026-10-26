#Somma di 3 numeri immessi in input

.data
	msg_input: .asciz "Inserisci tre numeri: \n"
	msg_output: .asciz "La somma è: "

.text
.globl main
main:
	la a0,msg_input
	li a7,4
	ecall
	
	li a7,5
	ecall 
	mv t0,a0
	
	li a7,5
	ecall
	mv t1,a0
	
	li a7,5
	ecall
	mv t2,a0
	
	add t3,t0,t1
	add t3,t3,t2
	
	la a0,msg_output
	li a7,4
	ecall
	
	mv a0,t3
	li a7,1
	ecall 
	 
	li a7,10
	ecall