#citeste n;
#s = 0;
#i = 1;
#cat timp (i <= n/2) executa
#  daca (n%i = 0) atunci s = s+i;
#  sfarsit daca
#  i = i+1;
#sfarsit cat timp
#daca (s = n) atunci scrie 'PERFECT';
#                        altfel   scire 'NU';
#sfarsit daca

.data
mesaj_n:
	.asciiz "Introduceti un nr: "
mesaj_perfect:
	.asciiz "Nr este perfect: "
mesaj_nu_perfect:
	.asciiz "Nr nu este perfect: "

.text
.globl main
main:
	li $v0,4 #afisam mesaj_n
	la $a0, mesaj_n
	syscall
	li $v0, 5 #citim n-ul
	syscall
	move $t0, $v0 #in t0 am incarcat val n de la tastatura; t0=n
	li $t1, 0 #s=0 l-am incarcat in t1
	li $t2, 1 #t2=i 
	
	#avem t0=n, t1=s, t2=i
	#loop==while
loop: 
	div $t0, $t2 #t0=t2/2
	mfhi $t3 #in t3=restul
	bgtz $t3, eticheta #daca restul e diferit de 0 sare la eticheta
	add $t1,$t1,$t2 #suma s=s+i
	
eticheta:
	addi $t2, $t2,1 #trecem la urmatorul divizor
	bne $t0,$t2,loop #daca $t2 diferit de nr($t0)

	#urmeaza if-urile
	beq $t0,$t2, afisare_perfect
	li $v0, 4
	la $a0, mesaj_nu_perfect
	syscall
	b final

afisare_perfect:
	li $v0, 4
	la $a0, mesaj_perfect
	syscall
	
final:
	done
	
	
	
	
	
	
	