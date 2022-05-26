#Testeaza daca un numar dat de la tastatura este nr. prim.

	.data
msg_citire:
	.asciiz "n = "
msg_prim:
	.asciiz "Numarul e prim!"
msg_neprim:
	.asciiz "Numarul nu e prim!"
	.align 2
n:
	.word 2

	.text
	.globl main
main:
	li $v0, 4		#afisare mesaj citire
	la $a0, msg_citire
	syscall

	li $v0, 5		#citire int
	syscall

	move $a0, $v0		#a0<- nr n (Ca sa il avem si dupa)
	la $t0, n         #baga in t0 adresa lui n
	sw $a0, ($t0)		#salvam n citit

	jal test_prim		#jump si salvare legatura (un fel de call) #apelam rutina
	bnez $s0, e_prim	#$s0 = ?  0 sau 1, daca e 1 sare la e prim daca nu afiseaza ca nu e prim
	la $a0, msg_neprim
	li $v0, 4
	syscall
	j sfarsit
e_prim:
	la $a0, msg_prim
	li $v0, 4
	syscall
sfarsit:
	li $v0, 10
	syscall

#rutina care verifica daca un numar este prim
#primeste nr. de verificat in $a0
#intoarce in $s0 val 1 daca nr e prim, 0 in caz contrar
test_prim:
	li $t0, 1		#$t0<-divizorii
repeta:
	addi $t0, $t0, 1 #tot adaugam unul
	sge $t3, $t0, $a0		#set daca greater or equal, e un fel bool - areEqual??  (vede daca divizorul o trecut de numar) - #div > n => nr. prim
	bnez $t3, gata_prim  #daca t3 !=0 sau daca t3 e true , fals nu intrra pe gata prim
	div $a0, $t0
	mfhi $t1		#t1<-rest
	mflo $t2		#t2<-cat
	beqz $t1, gata_neprim
	j repeta

gata_neprim:
	li $s0, 0 #seteaza s0 pe 0 sau pe 1 daca e sau nu prim - 1 prim
	j iesire_proc
gata_prim:
	li $s0, 1	
iesire_proc:
	jr $ra #sare la ra -  jr( jump la registru) - adresa de revenire salvata de jal 
