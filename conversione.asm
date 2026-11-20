#inserisci un carattere e poi stamparlo in binario, esadecimale, decimale

.data
	msg_input: .asciz "Inserisci un carattere: "
	msg_binario: .asciz "\nbinario: "
	msg_decimale: .asciz "\ndecimale: "
	msg_esadecimale: .asciz "\nesadecimale: "
.text
.globl main

main: 	
	la a0, msg_input
	li a7,4 
	ecall 
	
	li a7,12
	ecall
	 mv t0,a0
	j print_decimal
	
	
print_decimal:

	la a0,msg_decimale
	li a7,4 
	ecall
	
	mv a0,t0
	li a7,1
	ecall
	
	j print_binary
	
print_binary:
	la a0,msg_binario 
	li a7,4
	ecall
	
	li t1, 7
	loop_bin:
		srl t2,t0,t1	
		
		andi t2,t2,1
		
		mv a0, t2
		li a7,1
		ecall
		
		addi t1,t1,-1
		bge t1,zero,loop_bin 
		
 	
print_hex:
	la a0,msg_esadecimale
	li a7,4
	ecall 
	li t1, 4
	
	loop_hex:
		srl t2,t0,t1
		andi t2,t2,15
	
		li t3, 10
		blt t2,t3,hex_num
		
		addi a0,t2,55
		li a7,11
		ecall
		
		j hex_next
	
	hex_num:
		mv a0,t2
		li a7, 1
		ecall
	hex_next:
		addi t1, t1, -4
		bge t1,zero,loop_hex
	
exit: 
	li a7,10
	ecall
