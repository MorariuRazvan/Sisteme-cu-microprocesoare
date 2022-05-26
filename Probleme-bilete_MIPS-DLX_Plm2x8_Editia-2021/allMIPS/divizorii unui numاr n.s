#Realizaţi un program care afişează divizorii unui număr n (n - număr natural citit de la tastatură) în două variante.

.data
mesaj1: .asciiz "Introdu nr: "
mesaj2: .asciiz "Divizorii: "
spatiu: .asciiz " "
.text
.globl main
main:
    li $v0, 4
    la $a0, mesaj1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0 #nr citit de la tastatura
    li $t1, 1  #se afla 1 - cu ce imparti adica 
    li $v0, 4 #afiseaza mesajul 2
    la $a0, mesaj2 
    syscall
LOOP:
    sub $t2, $t0, $t1  #scad t2=t0-t1, ca sa vad daca divizorul o ajuns egal cu numarul (vezi mai jos) un fel de daca i==n
    div $t0, $t1  #impart
    mfhi $t4 # iau restul
    bgtz $t4, FINAL  #daca restul e >0, trece la urmatorul divizor
    li $v0, 1 #afsare numar --> este divizor
    move $a0, $t1
    syscall
    li $v0, 4  #afisare spatiu
    la $a0, spatiu
    syscall
FINAL:
    addi $t1, $t1, 1 #trece la urmatorul divizor
    bgtz $t2, #LOOP atata timp cat divizorul < n
done 
