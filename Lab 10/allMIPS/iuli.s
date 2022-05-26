.data
str1: .asciiz "Numarul:"

.text
.globl main
main:

	puts str1
	geti $a0	#primesc nr de la tastatura
	add $t0,$a0,0
	
	li $t1, 2
	add $t2, $t0,-1 #divizorii de gasesc in interv [2,n-1]
	
for:
	bge $t1, $t2, sfarsit #daca s-a ajuns la capat
	div $t0, $t1 #impartit numarul citit la toate numerele din interval
	mfhi $t3 #salvam restul 
	bnez $t3, gata #vedem daca se imparte exact, adica restul sa fie ==0
	li $v0, 1 #printeaza un int
	move $a0, $t1 #divizorul gasit 
	syscall 
gata:
	addi $t1, $t1, 1 #trece la urmatorul divizor
	blt $t1, $t2, for #atata timp cat divizorul < n

sfarsit: done
