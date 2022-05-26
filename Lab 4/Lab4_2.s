.data

read_n:
	.asciiz "n= "
read_k:
	.asciiz "k= "
write_combinari:
	.asciiz "Combinari de n luate cate k: "
write_aranjamente:
	.asciiz "Aranjamente de n luate cate k: "
	
.text

__start:

ver_n:puts read_n	    	  #afisez "n= "
	  geti $t1          	  #citesc n de la tastatura si verific sa fie pozitiv
	  bltz $t1,ver_n		  #daca nr citit e negativ citeste din nou
ver_k:puts read_k       	  #afisez "k= "
	  geti $t2 		    	  #citesc k de la tastatura si verific sa fie pozitiv
	  bltz $t2,ver_k		  #daca nr citit e negativ citeste din nou
	  blt $t1,$t2,ver_k
	  subu $t3,$t1,$t2  	  #t3<-n-k
	  move $a0, $t1     	  #$a0<-n
	  jal factorial     	  #jump la o procedura (linked-jump)
							  #call fact(n) in ra se pune adresa de revenire
	  move $t1,$t0      	  #$t1<-n!
	  move $a0, $t2     	  #$a0<-k
	  jal factorial     	  #jump la o procedura (linked-jump)
							  #call fact(k) in ra se pune adresa de revenire
	  move $t2,$t0      	  #$t2<k!
	  move $a0, $t3     	  #$a0<-n-k
	  jal factorial     	  #jump la o procedura (linked-jump)
							  #call fact(n-k) in ra se pune adresa de revenire
	  move $t3,$t0            #$t3<(n-k)!
	  mul $t2,$t2,$t3	      #t2<-k!*(n-k)!
	  div $t4,$t1,$t2         #$t4<-Combinari n luate cate k
	  div $t5,$t1,$t3         #$t5<-Aranjamente n luate cate k	
	  puts write_combinari
	  puti $t4
	  putc "\n"
	  puts write_aranjamente
	  puti $t5
stop: done
	  
factorial:
		 sw $ra,($sp)		  #push
		 addi $sp,$sp,-4
		 li $t0,1			  #$t0 initializat cu 1
		 beqz $a0,fin		  #daca nr citit este 0 treci la sfarsit
  multiply: mul $t0,$t0,$a0   #echivalent cu mul $t0,$a0 LO-pune ce nu da overflow
			addi $a0,$a0,-1   #decrementam nr
			bgtz $a0,multiply #daca nu am ajuns cu numarul la 1 sare la multiply
  fin: addi $sp,$sp,4	      #pop
	   lw $ra,($sp)
	   jr $ra                 #jump cu return
	   