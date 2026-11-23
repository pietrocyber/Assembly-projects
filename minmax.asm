#Inseriamo 3 numeri e troviamo il min e max

.data 
	msg_input: .asciz "Inserisci 3 numeri:\n "
	max: .asciz "max: "
	spazio: .asciz "\n"
	min:.asciz "min: "
.text
.globl main

main:
	la a0,msg_input
	li a7, 4
	ecall
	
	li a7,5
	ecall
	mv t0, a0
	li a7,5
	ecall
	mv t1,a0
	li a7,5
	ecall
	mv t2,a0
	
	mv a0,t0
	mv a1, t1
	mv a2,t2
	jal trova_max
	mv t3,a0
	
	
	mv a0,t0
	mv a1,t1
	mv a2, t2
	jal trova_min
	mv t4, a0
	
	
	la a0, max
	li a7,4
	ecall
	mv a0, t3
	li a7,1
	ecall
	
	la a0,spazio
	li a7,4
	ecall
	
	la a0, min
	li a7,4
	ecall
	mv a0,t4
	li a7,1
	ecall
	
	li a7,10
	ecall
	
	trova_max:
		bge a0,a1,max_check
		mv a0,a1
		max_check:
			bge a0,a2,fine_max
			mv a0,a2
		fine_max:
			ret
			
	trova_min:
		ble a0,a1, min_check
		mv a0,a1
		min_check:
			ble a0,a2, fine_min
			mv a0,a2
		fine_min:
			ret
		