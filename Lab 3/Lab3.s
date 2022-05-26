.data

read_n:
	.asciiz "n= "
write_numbers:
	.asciiz "Primele n numere prime sunt: "
.text
.globl main

 main:
	puts read_n				   #afisam "n= "
	geti $t0 				   #t0<-n (nr de elemente)
	puts write_numbers		   #afisam "Primele n numere ...."
 	li $t1,2 				   #t1<-posibile nr prime
	puti $t1 				   #afisez 2
	addi $t0,$t0,-1 		   #decrementam n
next_num: addi $t1,$t1,1 	   #urm nr posibil
		  li $t3,2			   #nr/2
		  div $t1,$t3 		   #catul e in low
		  mflo $t2 			   #t2<-jumatatea numarului
		  li $t4,2 		       #t4<-posibilii divizori
next_div: div $t1,$t4 		   #impartim nr meu la primul posibil divizor
	   	  mfhi $t5 		       #restul in t5
		  beqz $t5, next_num   #daca t5 e 0 sari la next_num (nr are divizori)
		  addi $t4,$t4,1 	   #urmatorul divizor
		  blt $t4,$t2,next_div #daca divizorul e mai mic decat 
							   #jumatea sari la next_div
		  putc ','			   #afisam virgula
		  puti $t1  		   #nr e prim => il afisez
		  addi $t0,$t0,-1      #decrementeaza n
		  bgtz $t0,next_num    #if n>0 go to next_num (daca mai trebuie sa afisam
							   #numere)
	done
	
	
	
   
   