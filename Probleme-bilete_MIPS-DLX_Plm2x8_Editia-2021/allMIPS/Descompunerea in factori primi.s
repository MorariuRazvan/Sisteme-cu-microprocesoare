#Descompunerea in factori primi 
.data
mesaj1: .asciiz "Introdu nr: "
mesaj2: .asciiz "Factori: "
putere: .asciiz "^"
spatiu: .asciiz " "
.text
.globl main
main:
    li $v0, 4
    la $a0, mesaj1
    syscall
    li $v0, 5 #citire de la tast
    syscall
    move $t0, $v0 #baga numarul in t0
    li $t1, 2 #divizor
    li $v0, 4
    la $a0, mesaj2 #afiseaaza mesajul 2
    syscall
    li $t3,0 #pt putere
LOOP:
    sub $t2, $t0, $t1 #daca divizorul o ajuns la numar
    div $t0, $t1 #impart cu divizorul
    mfhi $t4 #iau restul
    bgtz $t4, FINAL #daca restul >0, trece la urmatorul
    addi $t3, $t3, 1 #daca restul e egal cu 0 aduna la putere 
    mflo $t0 #impartim catul  adica 60/2
    beqz $t4, LOOP #se intoarce pana nu se mai imparte
FINAL:    
    beqz $t3, incrementare
    li $v0, 1
    move $a0, $t1 #afisare numar
    syscall  
    li $v0, 4
    la $a0, putere #mesaj de la putere
    syscall
    li $v0, 1
    move $a0, $t3 #putere
    syscall
    li $v0, 4
    la $a0, spatiu #spatiu
    syscall
    incrementare:
    li $t3,0 #resetam puterea
    addi $t1, $t1, 1  #adaugam 1 la divizori
    bgtz $t2, LOOP #ma intorc la numar
done 
