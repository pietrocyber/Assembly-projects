.data 
	msg_input: .asciz "Inserisci un numero da 0 a 999: "
	msg_output: .space 100
	
	zerol:.asciz "zero"
	uno:.asciz "uno"
	due:.asciz "due"
	tre:.asciz "tre"
	quattro:.asciz "quattro"
	cinque:.asciz "cinque"
	sei:.asciz "sei"
	sette:.asciz "sette"
	otto:.asciz "otto"
	nove:.asciz "nove"
	dieci:.asciz "dieci"
	undici:.asciz "undici"
	dodici:.asciz "dodici"
	tredici:.asciz "tredici"
	quattordici:.asciz "quattordici"
	quindici:.asciz "quindici"
	sedici:.asciz	"sedici"
	diciasette:.asciz "diciassette"
	diciotto:.asciz "diciotto"
	diciannove:.asciz "diciannove"
	venti:.asciz "venti"
	trenta:.asciz "trenta"
	quaranta:.asciz "quaranta"
	cinquanta:.asciz "cinquanta"
	sessanta:.asciz "sessanta"
	settanta:.asciz "settanta"
	ottanta:.asciz "ottanta"
	novanta:.asciz "novanta"
	cento:.asciz "cento"
	
.text

.globl main

main: 
	la a0, msg_input
	li a7,4
	ecall
	
	li a7,5
	ecall
	
	mv t0,a0 
	
	jal numeri
	
	la a0, msg_output
	li a7,4
	ecall
	
	li a7,10
	ecall
	
numeri:
	centinaia:
		addi sp, sp, -4
		sw ra, 0(sp)

		li t1,100
		div t2,t0,t1
		
		
		beq t0,zero,decine
		li t3,1
		beq  t2,t3,stringa_cento
		li t3, 2
		beq  t2,t3,stringa_duecento
		li t3, 3
		beq  t2,t3,stringa_trecento
		li t3, 4
		beq  t2,t3,stringa_quattrocento
		li t3, 5
		beq  t2,t3,stringa_cinquecento
		li t3, 6
		beq  t2,t3,stringa_seicento
		li t3, 7
		beq  t2,t3,stringa_settecento
		li t3, 8
		beq  t2,t3,stringa_ottocento
		li t3, 9
		beq  t2,t3,stringa_novecento
		j decine
		
		
	decine:
		rem t3,t0,t1
		li t1,19
		bgt t3,t1,numeri_speciali
		
		li t4,10
		blt t3,t4,unita

		beq t3,t4,stringa_dieci
		li t4,11
		beq t3,t4,stringa_undici
		li t4,12
		beq t3,t4,stringa_dodici
		li t4,13
		beq t3,t4,stringa_tredici
		li t4,14
		beq t3,t4,stringa_quattordici
		li t4,15
		beq t3,t4,stringa_quindici
		li t4,16
		beq t3,t4,stringa_sedici
		li t4,17
		beq t3,t4,stringa_diciasette
		li t4,18
		beq t3,t4,stringa_diciotto
		li t4,19
		beq t3,t4,stringa_diciannove
		j fine
	
		
	numeri_speciali:
		li t1,10
		div t5,t3,t1
		
		li t4,2
		beq t5,t4,stringa_venti
		li t4,3
		beq t5,t4,stringa_trenta
		li t4,4
		beq t5,t4,stringa_quaranta
		li t4,5
		beq t5,t4,stringa_cinquanta
		li t4,6
		beq t5,t4,stringa_sessanta
		li t4,7
		beq t5,t4,stringa_settanta
		li t4,8
		beq t5,t4,stringa_ottanta
		li t4,9
		beq t5,t4, stringa_novanta
		j unita
	
	unita:
		li t1,10
		rem t3, t0,t1
		li t4,1
		beqz t3,stringa_zero
		beq t3,t4,stringa_uno
		li t4,2
		beq t3,t4,stringa_due
		li t4,3
		beq t3,t4,stringa_tre
		li t4,4
		beq t3,t4, stringa_quattro
		li t4,5
		beq t3,t4, stringa_cinque
		li t4,6
		beq t3, t4, stringa_sei
		li t4, 7
		beq t3,t4,stringa_sette
		li t4, 8
		beq t3,t4,stringa_otto
		li t4, 9
		beq t3,t4, stringa_nove
		j fine
		
	


stringa_cento:
	la a0, cento
	jal stampa
	j decine
stringa_duecento:
	la a0,due
	jal stampa
	la a0,cento
	jal stampa
	j decine
stringa_trecento:
	la a0,tre
	jal stampa
	la a0,cento 
	jal stampa
	j decine
stringa_quattrocento:
	la a0,quattro
	jal stampa
	la a0, cento
	jal stampa
	j decine
stringa_cinquecento:
	la a0,cinque
	jal stampa
	la a0,cento
	jal stampa
	j decine
stringa_seicento:
	la a0,sei
	jal stampa
	la a0,cento
	jal stampa
	j decine
stringa_settecento:
	la a0,sette
	jal stampa
	la a0,cento
	jal stampa
	j decine
stringa_ottocento:
	la a0,otto
	jal stampa
	la a0,cento
	jal stampa
	j decine
stringa_novecento:
	la a0,nove
	jal stampa
	la a0,cento
	jal stampa
	j decine
	
stringa_dieci:
	la a0,dieci
	jal stampa
	j fine
stringa_undici:
	la a0,undici
	jal stampa
	j fine
stringa_dodici:
	la a0,dodici
	jal stampa
	j fine
stringa_tredici:
	la a0,tredici
	jal stampa
	j fine
stringa_quattordici:
	la a0,quattordici
	jal stampa
	j fine 
stringa_quindici:
	la a0,quindici
	jal stampa
	j fine
stringa_sedici:
	la a0,sedici
	jal stampa
	j fine 
stringa_diciasette:
	la a0,diciasette
	jal stampa
	j fine
stringa_diciotto:
	la a0,diciotto
	jal stampa
	j fine
stringa_diciannove:
	la a0,diciannove
	jal stampa
	j fine
stringa_venti:
	la a0,venti
	jal stampa
	j unita
stringa_trenta:
	la a0,trenta
	jal stampa
	j unita
stringa_quaranta:
	la a0,quaranta
	jal stampa
	j unita
stringa_cinquanta:
	la a0,cinquanta
	jal stampa
	j unita
stringa_sessanta:
	la a0,sessanta
	jal stampa
	j unita
stringa_settanta:
	la a0,settanta
	jal stampa
	j unita
stringa_ottanta:
	la a0,ottanta
	jal stampa
	j unita
stringa_novanta:
	la a0,novanta
	jal stampa
	j unita


stringa_zero:
	la a0,zerol
	jal stampa
	j fine
stringa_uno:
	la a0,uno
	jal stampa
	j fine
stringa_due:
	la a0,due
	jal stampa
	j fine
stringa_tre:
	la a0,tre
	jal stampa
	j fine
stringa_quattro:
	la a0,quattro
	jal stampa
	j fine
stringa_cinque:
	la a0,cinque
	jal stampa
	j fine
stringa_sei:
	la a0,sei
	jal stampa
	j fine
stringa_sette:
	la a0,sette
	jal stampa
	j fine
stringa_otto:
	la a0,otto
	jal stampa
	j fine
stringa_nove:
	la a0,nove
	jal stampa
	j fine

fine:
	lw ra, 0(sp)
	addi sp,sp,4
	ret
stampa:
	li a7,4
	ecall
	ret
	
	
