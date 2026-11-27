#Caricare un array di 20 interi, effettuo la media a posizioni pari e la somma in posizione dispari

.data
	msg_input: .asciz "Inserisci i numeri:\n"
	array: .word 0:20
	media: .asciz "\nLa media delle posizioni pari: "
	somma: .asciz "\nLa somma delle posizioni dispari: " 
.text
.globl main
main: 
	la a0, msg_input
	li a7,4
	ecall
	la t0,array
	li t1, 0
	li t2, 20
	loop_array:
		beq t1,t2, fine_lettura
		li a7,5
		ecall
		
		sw a0,0(t0)
		addi t0,t0,4
		
		addi t1, t1, 1
		j loop_array
		
	fine_lettura:
		la t0,array
		li t1, 0 
		li t2, 20
		li t3,0
		li t4,0
		li t6,2
		li t5,0
		
		loop:
			beq t1,t2, calcola_media
		
			lw s0,0(t0)
			rem s1,t1,t6
			beqz s1, pari
			j dispari
			pari:
				add t3,t3,s0
				addi t4,t4,1
				j avanza
				
			dispari:
				add t5,t5,s0
				j avanza
			avanza:
				addi t0,t0,4
				addi t1,t1,1
				j loop
		calcola_media:
			fcvt.s.w ft0,t3
			fcvt.s.w ft1, t4
			fdiv.s fa0,ft0,ft1
			j stampa
			
		stampa:
			la a0,media
			li a7,4
			ecall
			
			li a7,2
			ecall
			
			la a0,somma
			li a7,4
			ecall
			mv a0,t5
			li a7,1
			ecall
			
			li a7,10
			ecall
							
				

		
		
