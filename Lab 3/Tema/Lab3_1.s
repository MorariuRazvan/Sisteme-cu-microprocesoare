.data

read_n:
	.asciiz "n= "
write_pairs:
	.asciiz "Primele n perechi de numere prime sunt: "
.text
.globl main

  main:
	puts read_n 			   #afisam "n= "
	geti $t0 				   #t0<-n
	puts write_pairs 		   #afisam "Primele n perechi ..."
 	li $t1,2 				   #t1<-posibile nr prime
	putc '('  				   #(
	puti $t1 				   #afisez 2
	putc ',' 			 	   #,
next_num: addi $t1,$t1,1 	   #urm nr posibil
		  li $t3,2			   #nr/2
		  div $t1,$t3 		   #catul e in low
		  mflo $t2 			   #t2<-jumatatea numarului
		  li $t4,2 			   #t4<-posibilii divizori
next_div: div $t1,$t4 		   #impartim nr meu la primul divizor posibil
	   	  mfhi $t5 			   #restul in t5
		  beqz $t5, next_num   #daca t5 e 0 sari la next_num
		  addi $t4,$t4,1 	   #urmatorul divizor
		  blt $t4,$t2,next_div #daca divizorul este mai mic decat 
							   #jumatatea numarului sari la next_div
		  puti $t1  		   #nr e prim => il afisez
		  putc ')'			   #)
		  blt $t0,2,last_num   #daca nr de numerele prime pe care mai avem sa le 
							   #afisam este mai mic decat 2 (adica nu este 
							   #ultimul nr)
          putc ' '			   #spatiu
		  putc '('			   #(
		  puti $t1			   #afisam nr prim
		  putc ','			   #,
last_num: addi $t0,$t0,-1      #decrementeaza n
		  bgtz $t0,next_num    #if n>0 go to next_num
	done
	
	
	
   
   