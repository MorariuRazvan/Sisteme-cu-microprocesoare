#Cel mai mic multiplu comun al numerelor din vector
#   CMMDC	
#while(b!=0)
#	r = a%b
#	a = b
#	b = r
#cmmdc<-a

#      int n, i, s[100], cmmmc = 1;
#      cout<<"Cate numere: ";cin>>n;
#      for (i = 0; i < n; i++)
#          cin>>s[i];
#      for (i = 0; i < n; i++)
#          cmmmc = cmmmc * s[i]/cmmdc(cmmmc, s[i]);


.data
	mesajN: .asciiz "Cate numere are vectorul : "
    mesajNnegativ: .asciiz "N negativ!"
	mesajNumere: .asciiz "\nIntrodu numerele"
	mesajRezultat: .asciiz "\nCmmmc numerele = "
    
.align 4
	numere: .space 100

.text
.globl main
main:
puts mesajN
geti $t0
li $t1, 0 #ctor
blt $t0, $t1, negativ
la $t2, numere #adresa vectorului
puts mesajNumere
for_citire:
    geti $t3
    sw $t3, ($t2)
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    bne $t1, $t0, for_citire 

li $t1,0 #ctor
li $t6, 1 #cmmmc
la $t2, numere 
#      for (i = 0; i < n; i++)
#          cmmmc = cmmmc * s[i]/cmmdc(cmmmc, s[i]);
for_cmmmc:
    move $t3, $t6 # a- cmmdc
    lw $t4, ($t2) #b aka s[i]
    jal cmmdc
    lw $t4, ($t2) #s[i]
    div $t4,$t3
    mflo $t4 #catul
    mul $t6,$t6,$t4 #cmmmc = cmmmc * s[i]/cmmdc(cmmmc, s[i]);
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    blt $t1,$t0 for_cmmmc

puts mesajRezultat
puti $t6
done
#cmmdc
#t3<-a
#t4<-b
#t5<-r
cmmdc:
while:
    div $t3,$t4
    mfhi $t5 #rest
    move $t3, $t4
    move $t4,$t5
    bnez $t4, while
jr $ra #return
negativ:
    puts mesajNnegativ
    done
