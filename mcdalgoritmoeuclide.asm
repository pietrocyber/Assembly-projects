#scrivere un programma che calcola il massimo comune di due numeri interi posistivi. Utilizziamo l'algoritmo di Euclide

.globl start

.text

start:
	addi a0,a0, 20
	addi a1,a1, 40
	jal ra, mcd
	
stampa:
	li a7,1
	ecall

exit:
	li a7,10
	ecall
	
mcd: 
	beq a0,a1,fine
	bgt a1,a0,a1Grande
	
	
a0Grande:
	sub a0,a0,a1
	j mcd
	
a1Grande:
	sub a1,a1,a0
	j mcd
	
fine:
 	ret 