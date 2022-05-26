# int nr, rezultat = 0, putere = 1;
 #   int k;
  #  cin >> n;
   # cin>>k;
    #while(n != 0)
    #{
     #   int rest = n % k; 
      #  rezultat = rezultat + rest * putere;
       # putere = putere * 10;
        #n = n / 2;
    #}
    #cout << rezultat;

.data
mesaj_n:
	.asciiz "Introduceti n-ul: "
mesaj_k:
	.asciiz "Introduceti baza: "
mesaj_negativ:
	.asciiz "Nr introdus este negativ! "
.text
.globl main
main:
	puts mesaj_n
	geti $t0 #t0=n
	li $t2, 0 #il folosesc pt rezultat si pt test
	blt $t0, $t2, negativ #test de pozitivitate
	puts mesaj_k 
	geti $t1 #t1=k
	li $t3, 1 #putere
	li $t5, 10
	li $t6, 2

while:
	div $t0, $t1
	mflo $t4 #t4=rest
	mul $t4, $t4, $t3
	add $t2, $t2, $t4
	mul $t3, $t3, $t6
	div $t0, $t6
	mfhi $t0
	bnez $t0, while

afisare:
	puti $t2
	
negativ:
	puts mesaj_negativ
	done

	