.data
mesajNr: .asciiz "Introduceti un numar: "
mesajBaza: .asciiz "Introduceti baza dorita: "
mesajAfisare: .asciiz "Numarul dat in baza dorita este: "

.align 4
caracter: .space 4
vector: .space 200
#putc afiseaza in caracter
#puti afiseaza un numar
.text
	puts mesajNr  #affiseaza un string
	geti $t0 #cin>>numarul get i
	puts mesajBaza  #afiseaza un string
	geti $t1 #baza #citeste baza
	
	la $t3, vector 
	li $t4, 0
	
while1:
	addi $t4,$t4, 1
	div $t0, $t1
	mflo $t0 #catul
	mfhi $t6 #restul

	sw $t6, ($t3) #pune restul in vector
	add $t3, $t3, 4 #trece la urmatoare adresa din vector
	
	bnez $t0, while1 #cat timp n!=0
#aici merge invers de la sfarsit!!
while2:
	sub $t3, $t3, 4 #scad o adresa (iau de la capat ) t3 e la capatul vectorului => acm invers
	lw $t7, ($t3) #incarca efectiv ce se afla la t3 in t7 
	ble $7, 10, numarNormal #daca nu e cifra sare face ascii
	#convertire litere
	sub $t9,$t7,10 #litere mari - 10
	addi $t9,$t9,65 #65 adauga codul ascii incepand cu A => 65+0 => a 65+1 b etc..
	la $t2,caracter #incarca adresa caracter
	sw $t9, ($t2) #stocheaza caracterul in memorie
	puts caracter #afiseaza caracter
	j continua
numarNormal:
	puti $7
continua:
	sub $t4,$t4, 1
	bgtz $t4,while2  #daca e mai mare ca 1

done

