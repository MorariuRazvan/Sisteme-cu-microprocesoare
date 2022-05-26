.data

	array: .space 50
	n: .word 
	sum: .word

	read_n: 
		.asciiz "n= "
	write_sum:
		.asciiz "Suma numerelor este "	

.text
.globl main

	main:
	puts read_n			  #afisam "n= "
	geti $t0			  #t0<-nr de elemente
	sw $t0,n			  #in n salvam nr de elemente
	la $t1, array         #in t1 salvam pozitia din vector
	li $t2, 0             #initializam suma
	for:geti $t3		  #t3 <- elementul curent
		add $t2,$t2,$t3   #adunam elemntul curent la suma
		sw $t3, ($t1)     # array[i]<-t3
		addi $t1,$t1,4    # trecem la elem urm
		addi $t0, $t0, -1 #decrementam n
		bgtz $t0, for     #daca mai avem de citit 
	sw $t2, sum           #salvam suma
	puts write_sum		  #afisam "Suma numerelor este "
	puti $t2			  #afisam suma
	lw $t0, n			  #t0<-nr de elemente
	div $t1, $t0 		  #t1:t0 (suma:nr_de_elemente)
	mflo $t0 			  #catul e in low
	mfhi $t1 		      #restul e in high
	la $t2, sum			  #t2<-adresa sumei
	addi $t2, $t2, 4	  #trecem la eticheta sum , dupa suma
	sw $t0, ($t2) 		  #salvam catul
	sw $t1, 4 ($t2) 	  #salvam restul
    done
