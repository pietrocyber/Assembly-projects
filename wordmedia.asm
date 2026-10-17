#Inseriamo 4 numeri tramite word e facciamo la media aritmetica, il risultato va caricato in una word.


.globl start

.data 
v1: .word 10
v2: .word 12
v3: .word 14
v4: .word 16
v5: .word 0

.text 

start:
	la t0,v1
	lw t1,0(t0)
	lw t2, 4(t0)
	lw t3, 8(t0)
	lw t4, 12(t0)
	
	add t5,t1,t2
	add t5,t5,t3
	add t5,t5,t4
	
	srai t5,t5,2
	sw t5,16(t0)
	
end:
	li a7,10
	ecall