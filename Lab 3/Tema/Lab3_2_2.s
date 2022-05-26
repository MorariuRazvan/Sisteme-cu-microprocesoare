.data

read_n:
	.asciiz "n= "
write_divisors:
	.asciiz "Divizorii numarului sunt: "
power:
	.asciiz " la puterea "
	
.text
.globl main

main:
	puts read_n 		         #afisam "n= "
	geti $t0 			         #t0<-n
	puts write_divisors          #afisam "Dvizoruii numarului.."
    li $t1,2 				     #t1<-posibilii divizori
	li $t2,0				     #t2<-puterea divizorului curent
next_div: div $t0,$t1 		     #impartim numarul la primul divizor posibil
	   	  mfhi $t3 			     #t3<-restul
		  beqz $t3, is_div 	     #daca restul e 0 sari la is_div
		  bnez $t2, display      #daca restul nu este zero dar exista o putere a
							     #unui divizor sari la display
go_to_next: andi $t2,$t2,0	     #t4<-0
			addi $t1,$t1,1	     #trecem la urmatorul posibil divizor
			ble $t1,$t0,next_div #daca divizorul curent este mai mic cu
								 #decat numarul curent mergi la next_div
			b stop			     #daca nu este , sari la stop
display: putc '\n'			     #trecem la linie noua
		 puti $t1			     #afisam divizorul
		 puts power		   		 #afisam " la puterea "
		 puti $t2			     #afisam puterea 
		 b go_to_next			 #sati la go_to_next 	
is_div: addi $t2,$t2,1		     #incrementam puterea
		mflo $t0			     #t0<-n/divizor (catul)
		b next_div			     #sarim la next_divizor cu valoarea modificata
							     #a numarului din t0
stop: putc '\n'					 #trecem la linie noua
	  putc '1'		   	   		 #afisam 1
	  puts power			     #afisam "la puterea"
	  putc '1'					 #afisam 1
	  
	done
	
	
	
	
	
	
   
   