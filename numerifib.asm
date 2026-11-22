#Chiedere quanti numeri della sequenza di fibonacci deve generare, da 2 a 19 e li stampi tutti una riga

.data
	fib: .word 0:20 #creo un array
	msg_input: .asciz "Inserisci quanti numeri della sequenza di fibonacci devo generare(da 2 a 19): "
	spazio: .asciz ", "
	
.text 

.globl main
main:
	
	la a0, msg_input
	li a7,4 
	ecall
	
	li a7,5
	ecall
	fuori_range:
		li t1,2
		li t2, 19
		bgt a0,t2, main
		blt a0,t1,main
		j fibonacci

	fibonacci:
		mv s0, a0		
		la t0,fib
		
		li t1, 1
		
		sw zero,0(t0) 
		sw t1, 4(t0)
		
		addi s1, s0,-2
		loop_fib:
			lw t3,0(t0)
			lw t4, 4(t0)
			add t5, t3, t4		#prende i numeri precedenti -1 e -2 e poi calcola il nuovo numero di fib
			sw t5, 8(t0)			
			
			addi t0,t0, 4
			addi s1,s1,-1
			bgtz s1, loop_fib
			j stampa
	
	stampa:
		la t0, fib
		loop_stampa:
			lw a0, 0(t0)
			li a7,1
			ecall
	
			addi s0,s0,-1
			beqz s0, exit 
			
			la a0,spazio
			li a7,4
			ecall
		
			addi t0,t0,4
			j loop_stampa
	
exit:
	li a7,10
	ecall
		
