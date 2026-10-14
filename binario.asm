.data
stringa_richiesta:
.asciz "Inserisci un numero intero positivo: "
stringa_risultato:
.asciz "Il numero in binario e': "

.text
.globl main
main:
richiedi_numero:
	li a7,4
	la a0, stringa_richiesta
	ecall

	li a7,5
	ecall
	mv t0,a0
continua_programma:
	li a7, 4
	la a0, stringa_risultato
	ecall
	
	li t1, 31
loop_bit:
	srl t2,t0,t1
	andi t2,t2, 1 
	
	li a7, 1
	mv a0,t2
	ecall
	
	addi t1,t1,-1
	bge t1, zero, loop_bit
	
	

	li a7, 10
	ecall
