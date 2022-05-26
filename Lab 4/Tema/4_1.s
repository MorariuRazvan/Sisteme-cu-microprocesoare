.data

	array: .space 50
	n: .word 
	
	read_n: 
		.asciiz "n= "
		
.text

__start:

	main:
ver_n:puts read_n	    	    #afisez "n= "
	  geti $t0          	    #citesc n de la tastatura si verific sa fie pozitiv
	  bltz $t0,ver_n		    #daca nr citit e negativ citeste din nou
	  sw $t0,n			        #in n salvam nr de elemente
	  la $t1, array             #in t1 salvam pozitia din vector
citire:geti $t3		            #t3 <- elementul curent citit
	   sw $t3, ($t1)            #array[i]<-t3
	   addi $t1,$t1,4           #trecem la elem urm
	   addi $t0, $t0, -1        #n--
	   bgtz $t0, citire         #daca mai avem de citit
      li $t2, 1			        #sch=1
	  lw $t0, n				    #t0<-n
	  sub $t0, $t0, 1		    #t0<-n-1
bubble_sort:
	  beqz $t2, display		    #daca sch=0 sari la display
	  li $t2,0				    #sch=0
	  li $t3, 0			        #i=0;
	  la $t4, array		        #t4<-array
  for: 
      bge $t3, $t0, bubble_sort #daca i>=n-1 sari la bubble_sort
   if: 
	  lw $t5 , ($t4)		    #t5=array[i]
	  lw $t6 , 4 ($t4)          #t6=array[i+1]
   	  addi $t3,$t3,1			#i++
	  addi $t4,$t4,4		    #trecem la urm element (teoretic tot i++)
	  ble $t5,$t6,for			#if(array[i]<=array[i+1]) sari la for
	  sub $t4,$t4,4				#i--
	  li $t2,1					#sch=1
	  sw $t5 , 4 ($t4)			#array[i+1]=array[i]
	  sw $t6 , ($t4)			#array[i]=array[i+1]
	  addi $t4,$t4,4			#i++
	  b for						#sari la for
display:
	 la $t1, array         		#in t1 salvam vectorul
	 lw $t0,n					#t0=n
   scriere:
	  lw $t4,($t1)				#t4=array[i]
	  puti $t4					#afisam elementul
	  putc " " 					#afisam ' '
	  addi $t1,$t1,4    		#trecem la elem urm (i++)
	  addi $t0, $t0, -1 		#n--
	  bgtz $t0, scriere     	#daca mai avem de scris sari la scriere
stop: done
