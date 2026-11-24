#Inserisci un numero e sommare le cifre 

.data
	msg_input: .asciz "Inserisci un numero:  "
	msg_output:.asciz  "La somma è: "
	msg_negativo:.asciz "-"
.text
.globl main
main: 
	la a0, msg_input
	li a7,4
	ecall
	
	li a7,5
	ecall
	
	jal compute_sum

	
	la a0, msg_output
	li a7,4
	ecall
	mv a0,t0
	li a7,1
	ecall
	
	li a7,10
	ecall
	
	compute_sum:
		bgez a0, inizio_ciclo
		neg a0,a0
		
		inizio_ciclo:
		li t0,0
		li t1, 10
		
		ciclo:
			beqz a0, fine 
			
			rem t2, a0,t1
			add t0, t0, t2
			div a0,a0, t1
			j ciclo
		
		fine:
			mv a0, t0
			ret