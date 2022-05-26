#Bubble sort
#for(j = 0; j < n; j++)
# for(i = 0; i < n-1; i++)
# if(a[i] > a[i+1])
# interschimba-le

.data

mesajCitireN: .asciiz "Introduceti n: "
mesajCitireNumere: .asciiz "\nIntroduceti numerele: "
mesajVectorulSortat: .asciiz "\nVectorul sortat este: "

.align 4
vectorNumere: .space 100
.text
.globl main
main:

	puts mesajCitireN
	geti $t0
	puts mesajCitireNumere
	li $t2,0
	la $t3, vectorNumere #adresa vectorului
for_citire:
	geti $t1
	addi $t2,$t2,1
	sw $t1,($t3) #ca sa salvez in vector
	addi $t3, $t3, 4 #ca sa trec la adresa urmatoare din vector
	bne $t2,$t0, for_citire

li $t2, 0 #contor j
la $t3, vectorNumere #incarcam adresa vectorului CA INAINTE AM INCREMENTAT-0
sub $t5,$t0,1 #salvam n-1
for_1:
	li $t4, 0 #contor i
	for_2:
		mul $t8,$t4,4 #ca sa calculam adresa din vector, 4*i (ca e word)
		add $t8,$t8,$t3 #adaug adresei de inceput cat am calculat
		lw $t6,($t8) #incarc a[i] 

		mul $t9,$t4,4 #ca sa calculam adresa din vector, 4*i (ca e word)
		addi $t9,$t9,4 # +1 ca sa fie i+1
		add $t9,$t9,$t3 #adaug adresei de inceput cat am calculat
		lw $t7,($t9) #incarc a[i+1] 
		bgt $t6,$t7, switch
		continua:
		addi $t4,$t4,1
		blt $t4,$t5, for_2 #i<n-1
	addi $t2,$t2,1
	blt $t2,$t0, for_1
puts mesajVectorulSortat

li $t2,0
la $t3, vectorNumere #adresa vectorului
for_afisare:
	lw $t1,($t3)
	puti $t1
	addi $t2,$t2,1
	addi $t3, $t3, 4 #ca sa trec la adresa urmatoare din vector
	bne $t2,$t0, for_afisare
done

switch:
	sw $t6,($t9) 
	sw $t7,($t8)
	j continua
