.data

read_n:
	.asciiz "n= "
write_divisors:
	.asciiz "Divizorii numarului sunt: "
.text
.globl main

  main:
	puts read_n 			   #afisam "n= "
	geti $t0 				   #t0<-n
	puts write_divisors 	   #afisam "Divizorii numarului.."
    li $t1,2 				   #t1<-posibilii divizori
next_div: div $t0,$t1 		   #impartim numarul la primul divizor posibil
	   	  mfhi $t4 			   #t4<-restul
		  beqz $t4, is_div 	   #daca restul e 0 sari la is_div
		  addi $t1,$t1,1	   #trecem la urmatorul posibil divizor
		  blt $t1,$t0,next_div #daca divizorul curent este mai mic cu
							   #decat numarul curent mergi la next_div
is_div: puti $t1			   #afisam divizorul	
		putc ' '			   #spatiu
		mflo $t0			   #t0<-n/divizor (catul)
		bgt $t0,1,next_div	   #daca t0 este mai mare decat 1 sari la next_div
							   #sarim cu acelasi divizor ca data trecuta 
		putc '1'		   	   #afisam 1
	done
	
	
	
	
	
	
   
   