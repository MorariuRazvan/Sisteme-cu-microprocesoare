#Numbers less and greater than avergage 

.data
	mesajN: .asciiz "Cate numere are vectorul : "
	mesajNumere: .asciiz "\nIntrodu numerele: "
	mesajLess: .asciiz "\n Numerele mai mici decat media sunt: "
	mesajGreater: .asciiz "\n Numerele mai mari decat media sunt: "
    
.align 4
	numere: .space 100

.text
.globl main
main:
puts mesajN
geti $t0
li $t1, 0 #ctor
la $t2, numere #adresa vectorului
puts mesajNumere
for_citire:
    geti $t3
    sw $t3, ($t2)
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    bne $t1, $t0, for_citire 

li $t3,0 #suma
li $t1, 0 #ctor i
la $t2, numere #adresa vectorului
for_suma:
    lw $t4, ($t2)
    add $t3,$t3,$t4
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    bne $t1, $t0, for_suma
div $t3,$t0
mflo $t3 #average

li $t1, 0 #ctor i
la $t2, numere #adresa vectorului
puts mesajLess
for_less:
    lw $t4, ($t2)
    bge $t4,$t3, continua1 #daca e mai mare sa sar peste afisare
    puti $t4
    continua1:
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    bne $t1, $t0, for_less

puts mesajGreater
li $t1, 0 #ctor i
la $t2, numere #adresa vectorului
for_greater:
    lw $t4, ($t2)
    blt $t4,$t3, continua2 #daca e mai mic sa sar peste afisare
    puti $t4
    continua2:
    addi $t1,$t1,1 #incrementare ctor
    addi $t2,$t2,4 #incrementare adresa
    bne $t1, $t0, for_greater
