#Palindromul unui numar

#oglindit=0;
#copie_n=n;
#while (copie_n !=0){
#   ultimCifra = copie_n%10;
#   copie_n = copie_n/10
#   oglindit = oglindit*10 +ultimCifra
#}
#if(oglindit==n) ->Palindrom
#else ->Nu e
.data

	mesajIntroducetiN: .asciiz "Introduceti n: "
	mesajTrue: .asciiz "\nEste palindrom! "
	mesajFalse: .asciiz "\nNu este palindrom! "

main:
puts mesajIntroducetiN
geti $t0 #t0 <-n
li $t1,$t0 #copie_n 
li $t2,0  #oglindit 
while: 
    div $t1,10 #n/10 
    mfhi $t3 #ultima cifra
    mflo $t1 #copie_n = copie_n/10
    mul $t2,$t2,10 #oglindit*10
    add $t2,$t2,$t3 #oglindit*10 +ultimCifra
    bnez $t1, while #copie_n !=0
beq $t2,$t0, palindrom
puts mesajFalse
j sfarsit
palindrom:
    puts mesajTrue
sfarsit:
done
