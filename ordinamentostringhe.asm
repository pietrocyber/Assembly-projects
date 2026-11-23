# Ordinamento di 4 stringhe

.data
	first:     .asciz "Inserisci la prima stringa: "
	second:    .asciz "Inserisci la seconda stringa: "
	third:     .asciz "Inserisci la terza frase: "
	fourth:    .asciz "Inserisci la quarta frase: "
	msg_first: .asciz "Prima stringa: "
	msg_last:  .asciz "Ultima stringa: "

.text
.globl main
main:
	addi sp, sp, -100

	la a0, first
	li a7, 4
	ecall
	# leggo la prima stringa
	li a7, 8
	addi a0, sp, 0
	li a1, 25
	ecall

	la a0, second
	li a7, 4
	ecall
	# leggo la seconda stringa
	li a7, 8
	addi a0, sp, 25
	li a1, 25
	ecall

	la a0, third
	li a7, 4
	ecall
	# leggo la terza stringa
	li a7, 8
	addi a0, sp, 50
	li a1, 25
	ecall

	la a0, fourth
	li a7, 4
	ecall
	# leggo la quarta stringa
	li a7, 8
	addi a0, sp, 75
	li a1, 25
	ecall

	mv a0, sp
	jal first_string

	mv a0, sp
	jal last_string

	addi sp, sp, 100
	li a7, 10
	ecall

str_cmp:
	lbu t0, 0(a0)
	lbu t1, 0(a1)

	bne t0, t1, cmp_diff
	beq t0, zero, cmp_equal

	addi a0, a0, 1
	addi a1, a1, 1
	j str_cmp

cmp_diff:
	blt t0, t1, cmp_less
	li a0, 1
	ret

cmp_less:
	li a0, -1
	ret

cmp_equal:
	li a0, 0
	ret

first_string:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw s0, 4(sp)
	sw s1, 0(sp)

	mv s0, a0
	mv s1, s0

	addi a0, s0, 25
	mv a1, s1
	jal str_cmp
	bge a0, zero, first_cmp3
	addi s1, s0, 25

first_cmp3:
	addi a0, s0, 50
	mv a1, s1
	jal str_cmp
	bge a0, zero, first_cmp4
	addi s1, s0, 50

first_cmp4:
	addi a0, s0, 75
	mv a1, s1
	jal str_cmp
	bge a0, zero, first_print
	addi s1, s0, 75

first_print:
	la a0, msg_first
	li a7, 4
	ecall

	mv a0, s1
	li a7, 4
	ecall

	lw s1, 0(sp)
	lw s0, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	ret

last_string:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw s0, 4(sp)
	sw s1, 0(sp)

	mv s0, a0
	mv s1, s0

	addi a0, s0, 25
	mv a1, s1
	jal str_cmp
	ble a0, zero, last_cmp3
	addi s1, s0, 25

last_cmp3:
	addi a0, s0, 50
	mv a1, s1
	jal str_cmp
	ble a0, zero, last_cmp4
	addi s1, s0, 50

last_cmp4:
	addi a0, s0, 75
	mv a1, s1
	jal str_cmp
	ble a0, zero, last_print
	addi s1, s0, 75

last_print:
	la a0, msg_last
	li a7, 4
	ecall

	mv a0, s1
	li a7, 4
	ecall

	lw s1, 0(sp)
	lw s0, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	ret
	j exit
exit: 	
	li a7,10
	ecall
	