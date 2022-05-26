#Se citesc a,b,c coef intregi ai unei ec de gr 2 si un nr n. Fara a calcula radaciniile ecuatiei, calculati Sn=x1^n+x2^n
#include <iostream>
# using namespace std;
# int main() {
#   int a,b,c,n,S,P,v[11],OK=0,i=3;
#   cin>>a>>b>>c>>n;
#   S = (-1)*b/a;
#   P = c/a;
#   if(n==1)
#       {cout<<S;   
#            return;}
#   if(n==2)
#       { cout<<S*S - 2*P;  return;}
#     v[1] = S;
#     v[2] = S*S - 2*P;
#     while(n!=2) {
#        v[i] = S*v[i-1] - P*v[i-2];
#        i++;
#        n--;
#      }
#      cout<<v[i-1];
# }

.data

mesajCitireN: .asciiz "Introduceti n: "
mesajCitirea: .asciiz "\nIntroduceti a: "
mesajCitireb: .asciiz "\nIntroduceti b: "
mesajCitirec: .asciiz "\nIntroduceti c: "
mesajRezultat: .asciiz "\nRezultatul este: "
mesajNnegativ: .asciiz "\n N este negativ. Incearca din nou :( "

.align 4
vectorNumere: .space 100
.text
.globl main
main:
puts mesajCitireN
geti $t0 #n
bltz $t0, negativ
puts mesajCitirea
geti $t1 #a
puts mesajCitireb
geti $t2 #b
puts mesajCitirec
geti $t3 #c

#   S = (-1)*b/a;
#   P = c/a;
li $t5, -1 #s
div $t2,$t1
mflo $t4
mul $t4,$t4,$t5  #S = (-1)*b/a;
div $t3,$t1
mflo $t5          #P = c/a;


#   if(n==1)
#       {cout<<S; OK=1;  
#            return;}
#   if(n==2)
#       { cout<<S*S - 2*P; OK=1; return;}

beq $t0,1,afisare1
beq $t0,2,afisare2


#v[1] = S;
#     v[2] = S*S - 2*P;
#     while(n!=2) {
#        v[i] = S*v[i-1] - P*v[i-2];
#        i++;
#        n--;
#      }
#      cout<<v[i-1];

la $t6, vectorNumere
sw $t4, ($t6) #v[1] = S;
li $t8, 2 #pentru inmultit cu 2
mul $t8,$t4,$t4 #S*S
mul $t9, $t8, $t5 #2*P
sub $t9,$t8,$t9 #S*S - 2*P
addi $t6, $t6, 4
sw $t9, ($t6) #v[2] = S*S - 2*P;


#v[i] = S*v[i-1] - P*v[i-2];
#        i++;
#        n--;

while:
    addi $t6,$t6,4 #i++
    sub $t7, $t6, 4 #v[i-1]
    lw  $t9, ($t7)
    mul $t7, $t4, $t9 #S*v[i-1]
    sub $t8, $t6,8 #v[i-2]
    lw  $t9, ($t8)
    mul $t8, $t5, $t9 #P*v[i-2];
    sub $t8,$t7,$t8 #v[i] = S*v[i-1] - P*v[i-2];
    sw $t8, ($t6) #v[i] = rezultat de mai sus
    sub $t0,$t0,1 #n--
    bne $t0,2, while

sub $t6,$t6,4 #v[i-1]
lw $t7, ($t6)
puts mesajRezultat
puti $t7
done

afisare1:
    puti $t4
    done

afisare2:
    li $t7, 2 #pentru inmultit cu 2
    mul $t6,$t4,$t4 #S*S
    mul $t7, $t7, $t5 #2*P
    sub $t6,$t6,$t7 #S*S - 2*P
    puti $t6
    done

done
negativ:
puts mesajNnegativ
j main

