.data

read_n:
	.asciiz "n= "
perfect:
	.asciiz "Numarul este perfect."
not_perfect:
	.asciiz "Numarul nu este perfect."
	
.text

__start:

ver_n:puts read_n	    	  #afisez "n= "
	  geti $t0          	  #t0<-n si verific sa fie pozitiv
	  bltz $t0,ver_n		  #daca nr citit e negativ citeste din nou
	  li $t1,2				  #t1<-2
	  div $t0,$t1 		      #catul e in low
	  mflo $t1 			      #t1<-n/2
	  li $t2,0				  #t2<-divizorul
next_div: addi $t2,$t2,1	  #t2<-t2+1 (Crestem divizorul)
		  bgt $t2,$t1,display #Daca divizorul este mai mare decat jumatatea nr
							  #sarim la display
		  div $t0,$t2 		  #impartim numarul la primul divizor posibil
	   	  mfhi $t3 			  #t3<-restul
		  bnez $t3, next_div  #daca restul e diferit de 0 sari la is_div
		  add $t4,$t4,$t2     #t4<-t4+divizorul curent (t4<-suma divizorilor)
		  b next_div	      #sarim la next_divizor
display:
		beq $t0, $t4 , _perfect #daca numarul este egal cu suma divizorilor sarim
								#la _perfect
		puts not_perfect        #altfel se afiseaza "Numarul nu este perfect"
		b stop					#sarim la stop
_perfect:puts perfect			#se afiseaza "Numarul este perfect"
stop: done
