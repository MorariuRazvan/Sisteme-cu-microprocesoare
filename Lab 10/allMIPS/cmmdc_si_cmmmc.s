#Calculeaza cmmmc a 2 nr. citite de la tastatura.
#Algoritm:
#while(b!=0)
#	r = a%b
#	a = b
#	b = r
#cmmdc<-a
#cmmmc<-(a*b)/cmmdc

.data
mesajA: .asciiz "a = "
mesajB: .asciiz "b = "
mesajCMMDC: .asciiz "cmmdc = "
mesajCMMMC: .asciiz "\ncmmmc = "

.text
.globl main

main:
puts mesajA
geti $t0
move $t4, $t0 #salvam pentru cmmmc
puts mesajB
geti $t1
move $t5, $t1 #salvam pentru cmmmc
while:
    div $t0,$t1
    mfhi $t2 #rest
    move $t0, $t1
    move $t1,$t2
    bnez $t1, while
puts mesajCMMDC
puti $t0
mul $t4,$t4,$t5 
div $t4,$t0
mflo $t6
puts mesajCMMMC
puti $t6


