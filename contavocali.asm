#Immettere una stringa di almeno 40 caratteri e poi contare le vocali

.data 
	msg_input: .asciz "Inserisci una frase: "
	stringa: .space 41
	errore: .asciz "Errore: la stringa è troppo grande "
	msg_output: .asciz "Le vocali sono: "
	
.text 
.globl main 
main:
	la a0, msg_input
	li a7,4
	ecall 
	
	li a7,8
	la a0, stringa
	li a1, 41
	ecall
	
	la t0, stringa
	li t1, 0
	
	lunghezza:
		lbu t2, 0(t0)
		beqz t2, fine_lunghezza
		li t4, 10
		beq t2,t4,fine_lunghezza
		addi t1,t1, 1
		addi t0,t0 ,1
		bge t1, a1,error
		j lunghezza
		
		error:
			la a0, errore
			li a7,4
			ecall
			j main
			
		fine_lunghezza:
			j conta_vocali
			
			
conta_vocali:
	la t0, stringa
	li t3, 0
	
	loop:
		lbu t1, 0(t0)
		beqz t1, stampa_risultato
		
		#vocali minuscole
		li t2,'a'
		beq t1,t2, vocale
		li t2, 'e'
		beq t1,t2, vocale
		li t2, 'i' 
		beq t1,t2, vocale
		li t2, 'o'
		beq t1,t2, vocale
		li t2, 'u'
		beq t1,t2, vocale
		
		#vocali maiuscole
		li t2,'A'
		beq t1,t2, vocale
		li t2, 'E'
		beq t1,t2, vocale
		li t2, 'I' 
		beq t1,t2, vocale
		li t2, 'O'
		beq t1,t2, vocale
		li t2, 'U'
		beq t1,t2, vocale
		
		j prossimo_carattere
	vocale:
		addi t3,t3,1
		
	prossimo_carattere:
		addi t0,t0,1
		j loop
	stampa_risultato:
		la a0, msg_output
		li a7,4
		ecall
		
		mv a0,t3
		li a7,1
		ecall
		
		li a7,10
		ecall
		