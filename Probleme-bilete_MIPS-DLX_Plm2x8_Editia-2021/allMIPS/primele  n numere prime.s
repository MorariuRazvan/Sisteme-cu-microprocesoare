#Afişarea la consolă a primelor n numere prime [(iniţial n = 24, ulterior n = 25  24); (parametrul n se dă de la tastatură)].
.data
mesaj1: .asciiz "Introdu nr: "
.text
.globl main
main:
    li $v0, 4  #Afisare text ecran
    la $a0, mesaj1
    syscall

    li $v0, 5   #Citire de la tastatura
    syscall
    move $t0, $v0
    li $t1, 2  #incep numere primele de la 2
    li $t2, 2 #nr pentru divizare
LOOP:
    sub $t3, $t1, $t2  #scaderea dintre cele 2
    beqz $t3, AFISARE #daca numele sunt egale afisam  (pt ca nu mai am cu ce sa impart, divizorul == n)
    div $t1, $t2 #daca nu sunt egale, impart ca sa vad daca restul e 0 sau nu
    mfhi $t4  #iau restul
    beqz $t4, FINAL #daca restul e 0 sar la final pentru ca nu e numar prim
    addi $t2, $t2, 1 #trecem la urmatorul divizor
    bgtz $t0, LOOP #daca e > 0 daca ce am citit de la tastatura e >0
AFISARE:
    addi $t0, $t0, -1  #am gasit un numar prim, scade nr  de numere prime care mai trebuie afisate  (n-1 nr prime de afisat )
    li $v0, 1  #afisare numar
    move $a0, $t1  #in a0 pune numarul ce trebuie afisat
    syscall
FINAL:
    addi $t1, $t1, 1 #trecem la urmatorul numar
    li $t2, 2 #resetam divizorul ( ala cu care imparte)
    bgtz $t0, LOOP #daca e >0 continua
done 
