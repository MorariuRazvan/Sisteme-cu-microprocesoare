#Afisati sirul in ordine inversa - nerectursiv 
.data
mesajCitire:	.asciiz "Introduceti un sir de caractere caractere (sirul se incheie cu '0'): "
mesajRezultat:	.asciiz "\nSirul inversat este: "

.align 4
sir: .space 200

.globl main
.text

main:
la $t1, sir #pentru a citi sir
li $t2,0  #contor pentru numarul de caractere
puts: mesajCitire
whileCitire:
getc $t0 
sw $t0, ($t1)  #am stocat un caracter in memorie
add $t1,$t1,4  #am incrementat adresa
addi $t2,$t2,1 #incrementam contorul - ca sa stim cate citim
bn3 $t0, 0x00000030, whileCitire #continuam citirea pana cand se citeste caracterul 0 

puts mesajRezultat
sub $t1, $t1, 4 #sa scapam de 0-ul ala afisat 
whileAfisare:
sub $t1, $t1, 4  #scad locatia
sub $t2, $t2, 1 #scad contor
lw $t2, ($t1)
putc $t2
bnez $t2, whileAfisare


