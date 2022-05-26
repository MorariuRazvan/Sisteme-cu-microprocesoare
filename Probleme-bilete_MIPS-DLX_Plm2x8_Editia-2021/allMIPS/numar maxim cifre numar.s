#Sa se determine numarul maxim obtinut din cifrele numarului 

# int main(){
# int n,ultimaCifra,i,ct,j;
# cin>>n;
# int v[40];
# i=0; ct=0;
# while(n!=0)
# {
#    ultimaCifra = n%10;
#    v[i]=ultimaCifra;
#    i++;
#    ct++;
#    n=n/10;
# }
# for(j = 0; j < ct; j++)
# for(i = 0; i < ct-1; i++)
# if(v[i] < v[i+1]){
#     swap(v[i], v[i+1]);}
    
# for(i = 0; i < ct; i++)
# { cout<<v[i]<<" ";}
    
# }

.data

mesajCitireN: .asciiz "Introduceti n: "
mesajCitireNumere: .asciiz "Numarul este negativ"
mesajRezultat: .asciiz "\nCel mai mare numar este:  "

.align 4
vectorNumere: .space 100
.text
.globl main
main:
puts mesajCitireN
geti $t0 #n
li $t8, vectorNumere #adresa vectorului 
li $t2, 0 #i
li $t3, 0 #ultimaCifra
li $t4, 0 #ct
li $t5,10 #pt impartire
blt $t0, $t1, negativ

#while(n!=0)
# {
#    ultimaCifra = n%10;
#    v[i]=ultimaCifra;
#    i++;
#    ct++;
#    n=n/10;
# }

ultima_cifra:
    div $t0,$t5
    mfhi $t7 #ultimaCifra = n%10;
    sw $t7, ($t8) #incarc ultima cifra in vector
    addi $t2,$t2,1 #i++
    addi $t4,$t4,1 #ct++
    addi $t8,$t8,4 #incrementare adresa in vector
    div $t0,$t5
    mflo $t0 #n ul
    bnez $t0, ultima_cifra

# for(j = 0; j < ct; j++)
# for(i = 0; i < ct-1; i++)
# if(v[i] < v[i+1]){
#     swap(v[i], v[i+1]);}
    
# for(i = 0; i < ct; i++)
# { cout<<v[i]<<" ";}
    
# }

li $t3, 0 #contor j
la $t8, vectorNumere #incarcam adresa vectorului CA INAINTE AM INCREMENTAT-0
sub $t5,$t4,1 #salvam ct-1
for_1:
    li $t2, 0 #ctor i
    for_2:
        mul $t9, $t2,4
        add $t9,$t9,$t8
        lw $t6,($t9)
        mul $t7, $t2, 4
        addi $t7,$t7,4
        add $t7,$t7,$t8
        lw $t1,($t7)
        blt $t6,$t1, switch
        continua:
        addi $t2,$t2,1
        blt $t2,$t5, for_2
addi $t3, $t3,1
blt $t3,$t4,for_1

li $t2, 0 #contor j
la $t8, vectorNumere #incarcam adresa vectorului CA INAINTE AM INCREMENTAT-0
for_afisare:
	lw $t1,($t8)
	puti $t1
	addi $t2,$t2,1
	addi $t8, $t8, 4 #ca sa trec la adresa urmatoare din vector
	bne $t2,$t4, for_afisare
done
negativ:
    puts mesajNnegativ
    done

switch:
	sw $t1,($t9) 
	sw $t6,($t7)
	j continua
