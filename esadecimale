.data
stringa_richiesta:
.asciz "Inserisci un numero intero positivo: "
stringa_risultato:
.asciz "Il numero in esadecimale e': "

.text
.globl main
main:
richiedi_numero:
	li a7,4
	la a0,stringa_richiesta
	ecall
	
	li a7, 5
	ecall
	mv t0,a0 

continua_programma:
	li a7,4
	la a0,stringa_risultato
	ecall
	
	li t1,28
loop_esa:
	srl t2,t0,t1
	andi t2, t2, 15
	
	li t3, 10 
	blt t2, t3, stampa_cifra_num
	
	addi t2,t2,55
	
	li a7,11
	mv a0,t2
	ecall
	j aggiorna_ciclo
	
stampa_cifra_num:
	li a7,1
	mv a0,t2
	ecall
	
aggiorna_ciclo:
	addi t1,t1,-4
	bge t1,zero,loop_esa
	
	li a7,10