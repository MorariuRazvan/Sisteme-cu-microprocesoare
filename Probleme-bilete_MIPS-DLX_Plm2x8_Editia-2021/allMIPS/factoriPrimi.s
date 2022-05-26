#Descompunerea in factori primi
# cin>>n;
# //variabila d este initializata cu 2 (primul posibil divizor propriu)
# d=2;
# while(n>1)
#     {
#         p=0;//p este initializat cu 0, pentru ca de fiecare data cand se reia instructiunea while sa se poata determina puterea la care apare factorul prim
#         //se verifica daca numarul n se imparte de mai multe ori la numarul d
#         while(n%d==0)
#         {
#             p++; //se contorizeaza puterea la care apare factorul prim in descompunere
#             n=n/d; //se imparte n la d pentru a se putea continua impartirea si identificarea puterii
#         }
#         //daca numarul d se imparte macar o data la n se afiseaza d, alaturi de puterea la care apare in descompunere
#         //daca p este 0 inseamna ca numarul d nu se imparte deloc la n
#         if(p>0)
#             cout<<d<<"^"<<p<<" ";
#         d=d+1; //creste d, pentru a putea identifica si alti factori primi ai descompunerii
#     }
# }
.data
mesaj1: .asciiz "Introdu nr: "
mesaj2: .asciiz "Factori: "
putere: .asciiz "^"
spatiu: .asciiz " "
.text
.globl main
main:
    puts mesaj1
    geti $t0 #n
    li $t1, 1 #divizor (d)
    puts mesaj2
    
while_1:
    addi $t1,$t1,1  #d=d+1; 
    li $t3,0 #pt putere p=0
    while_2:
        div $t0,$t1
        mfhi $t2 #n%d==0
        mflo $t0 #n=n/d;
        addi $t3,$t3,1 #p++
        beqz $t2 while_2     
     #         if(p>0)
     #             cout<<d<<"^"<<p<<" ";
    bgtz $t3, afisare
bgt $t0, 1, while_1
afisare: 
    puti $t1
    puts putere
    puti $t3
    puts spatiu
	