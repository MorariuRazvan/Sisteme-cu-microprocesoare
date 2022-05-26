.data
	array: .word 1, 3, 5, 7, 9, 11
	n: .word 6
	sum: .word

.text
.globl main

	main:
	lw $t0, n  
	li $t1, 0 
	la $t2, array
	for:  lw $t3, ($t2)
		add $t1, $t1, $t3
		addi $t0, $t0, -1
		addi $t2, $t2, 4
		bgtz $t0, for 
	sw $t1, sum
	lw $t0, n
	div $t1, $t0
	mflo $t0 
	mfhi $t1 
	la $t2, sum
	addi $t2, $t2, 4
	sw $t0, ($t2) 
	sw $t1, 4 ($t2) 
    done
