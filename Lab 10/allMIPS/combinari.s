.data
mesaj_n: .asciiz "Introduceti n:"
mesaj_k: .asciiz "Introduceti k:"
mesaj_aranjamente: .asciiz "\n Aranjamente:"
mesaj_combinari: .asciiz "\n Combinari:"
.text
.globl main
main:
    puts mesaj_n
    geti $t0 #n
    puts mesaj_k
	geti $t1 #k
    sub $t4,$t0,$t1 #n-k
#Calculam -n!
    li $t2,1 #aici salvam n!
    li $t3,1 #i=1-ul de la for
for_n:
    mul $t2,$t2,$t3 #factorial = factorial * i
    addi $t3,$t3,1 #creste ctor
    bge $t0,$t3, for_n  #i<=n ( greater or equal)  

    li $t5,1 #aici salvam k!
    li $t3,1 #i=1 
for_k:
    mul $t5,$t5,$t3 #k = k *i
    addi $t3,$t3,1 #i++
    bge $t1,$t3, for_k # k>=i (i<=k)

    li $t6,1 #aici salvam n-k!
    li $t3,1 #i=1
for_nk:
    mul $t6,$t6,$t3  
    addi $t3,$t3,1
    bge $t4,$t3, for_nk

    #Aranjamente
    puts mesaj_aranjamente
    div $t2,$t5 # n!/k!
    mflo $a0 # luam catul
    puti $a0

#Combinari
    puts mesaj_combinari #combinari = aranjamente / (n-k)
    div $t2,$t5 #n!/k!
    mflo $t2 #t2<-catul 
    div $t2,$t6  #(n! / k! ) / (n-k)!
    mflo $a0 #catul
    puti $a0
