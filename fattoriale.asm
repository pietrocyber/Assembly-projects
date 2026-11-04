#Immettere un numero e calcolare il fattoriale di quel numero


.data 
	msg_input: .asciz "Inserisci il numero: "
	
.text

.globl main 

main:
	la a0,msg_input
	li a7,4
	ecall
	
	li a7,5
	ecall
	
	jal fattoriale

stampa: 
	li a7,1
	ecall

exit:
	li a7,10
	ecall
	
fattoriale: 
	li t0,2
	bge a0,t0,else
	li a0,1
	jr ra
	else:
	addi sp,sp,-8
	sw a0,4(sp)
	sw ra,0(sp)
	addi a0,a0,-1
	jal fattoriale
	lw t0,4(sp)
	mul a0,a0,t0
	lw ra,0(sp)
	addi sp,sp,8
	jr ra
