.data
input_str1: .space 20 
input_str2: .space 20
risultato: .space 40

msg_richiesta1: .asciz "Inserisci la prima stringa(massimo 19 caratteri): "
msg_richiesta2: .asciz "Inserisci la seconda stringa(massimo 19 caratteri): "
msg_output: .asciz "Stringa concatenata: "

.text
.globl main
main:
richiesta: 
	li a7,4
	la a0,msg_richiesta1
	ecall
	
	li a7,8
	la a0,input_str1
	li a1,20
	ecall
	
	li a7,4
	la a0,msg_richiesta2
	ecall
	
	li a7,8
	la a0, input_str2
	li a1,20
	ecall
	
	la t0, input_str1
	la t1, risultato

copia_str1:
	lb t2, 0(t0)
	beq t2,zero,fine_str1
	sb t2, 0(t1)
	
	addi t0,t0, 1
	addi t1,t1, 1
	j copia_str1
	
fine_str1:
	la t0, input_str2
	
copia_str2:
	lb t2, 0(t0)
	beq t2, zero, fine_str2
	
	sb t2,0(t1)
	
	addi t0,t0,1
	addi t1,t1, 1
	j copia_str2
	
fine_str2:
	sb zero, 0(t1)
	
	li a7,4
	la a0,msg_output
	ecall
	
	li a7,4
	la a0, risultato
	ecall
	
	li a7,10
	ecall
	