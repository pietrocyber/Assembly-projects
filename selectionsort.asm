#Fare il selection sort di un array
.data
.align 2
	vettorenumeri: .word 36, 20, 27, 15, 1, 62, 41
	spazio: .asciz " "
.text 
.globl main
main:
	la a0,vettorenumeri
	la a1, vettorenumeri
	addi a1,a1,24
	jal sort 
	
	la t0,vettorenumeri
	la t1, vettorenumeri
	addi t1,t1,28

stampa: 
	li a7, 1
	lw a0, 0(t0)   #con queste 3 righe stampi il numero
	ecall
	
	li a7,4
	la a0, spazio   #con queste tre righe stampo lo spazio tra un numero e l'altro
	ecall 
	
	
	addi t0,t0,4 
	bne t0,t1,stampa
	
exit:
	li a7,10
	ecall	
	
sort:
	esterno:
		mv t0,a0
		mv t1,a0
		lw t2,0(a0)
		
	interno:
		beq t0,a1,scambia
		addi t0,t0,4
		lw t3, 0(t0) 
		ble t3,t2,interno
		mv t1,t0
		mv t2,t3
		j interno
		
	scambia:
		lw t3,0(a1)
		sw t3, 0(t1)
		sw t2,0(a1)
		addi a1,a1,-4
		bgt a1,a0, esterno
		jr ra
