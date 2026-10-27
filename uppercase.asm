#Inserire una frase e stamparela con uppercase

.data
	input_msg: .asciz  "Inserisci una frase: "
	output_msg: .asciz "La frase aggiornata è: "
	frase: .space 32

.text
.globl main:

main:
	la a0,input_msg
	li a7, 4
	ecall 
	
	la a0,frase
	li a1,32
	li a7,8
	ecall

	la a0, output_msg
	li a7,4
	ecall
	
	li t0,frase
	li t2, 'a'
	li t3,'z'
	
	
ciclo:
	lb t1,0(t0)
	beqz t1, exit_loop
	blt t1,t2, avanti
	blt t1,t3, avanti
	addi t1,t1, -32
	
	sb t1, 0(t0)
	
	
continua:
	addi t0,t0,1
	j ciclo
	
	
		
			
				
exit_loop:
	li a0,output_msg
	li a7,4
	ecall
	li a7, 10
	ecall	