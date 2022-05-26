#for (i = 0; i < n-1; i++)
#	for (j = i+1; j < n; j++)
#		if(a[i] < a[j])
#			swap

.data

	mesajIntroducetiN: .asciiz "Introducteti n: "
	mesajIntroducetiNumerele: .asciiz "Introduceti numerele: "
	spatiu: .asciiz " "

#daca vrem sa stocam in memorie n si vectorul	
.align 4  
	
	n: .space 4
	vector: .space 150

.text
.globl main
	la $a0,mesajIntroducetiN  #afisare mesaj
	li $v0,4
	syscall
	
	li $v0,5   #citire de la tastatura
	syscall

	move $t0,$v0  #$0 primeste ce cititm de la tastatura
	la $t1,n   #n<-$t0
	addi $t9,$t0,-1 #t9=n-1  declaram pentru contorul al doilea forului
	sw $v0,($t1) #pune n citit la n
	
	la $a0,mesajIntroducetiNumerele
	li $v0,4  #functie afisare mesaj
	syscall
	
	la $t1,vector #adresa vector
	li $t2,0 #contor numere citire (i de la for)
	
buclaCitire:
	li $v0,5
	syscall
	move $t3, $v0 # pune ce am citit de la tastatura in t3 (elementul din vector)
	sw $t3,($t1) #punem in vector ce e in memorile la adresa zisa de t1
	addi $t1,$t1,4 #incrementam adresa (word == 4, halfword == 2)
    addi $t2,$t2,1 #incrementam i ul  
bne $t2,$t0, buclaCitire #cat timp sunt diferite 
	
la $t1, vector #mai punem odata vectorul ca l-am stricat la citire
li $t2,0
for1:
	addi $t3,$t2, 1 #j=i+1
		for2:
			mul $t6,$t2, 4
			mul $t7,$t3, 4
			add $t6,$t1,$t6 #addresa lui a[i]
			add $t7,$t1,$t7  #adresa lui a[j]
			lw $t4, ($t6)
			lw $t5, ($t7)
			blt $t4, $t5, increment #grater of equal, ca sa sarim peste swap complet daca  t4<t5
			#swap - ca cu aux 
			sw $t5, ($t6)
			sw $t4, ($t7) 
			increment:
				addi $t3,$t3, 1 #j++
			blt $t3, $t0, for2 #conditia de la for2 j<n
		addi $t2,$t2, 1 #i++
		blt $t3,$t9, for1 # conditie oprire if i<n-1

#afisare ( t1<- adresa vector)
afisare:
	lw $t2, ($t1)
	li $v0,1
	move $a0, $t2
	syscall
	addi $t1,$t1,4
	addi $t0,$t0, -1 #scazi n
	bnez $t0, afisare #n!=0



