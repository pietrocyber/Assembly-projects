# Carichiamo 3 numeri e poi definiamo quello che è il massimo 

.global start
.text 

start:
	li t0,10
	li t1, 12
	li t2, 13

primoif:	
	ble t0,t1, condizione
	addi t3,t0,0
	j secondoif

secondoif:
	ble t3,t2,condizione2
	addi t3,t3,0
	j end
	
condizione:
	addi t3,t1,0
	j secondoif
	
condizione2:
	addi t3,t2,0
	j end
	
end:
	li a7,1
	add a0,t3,zero
	ecall
	li a7,10
	ecall