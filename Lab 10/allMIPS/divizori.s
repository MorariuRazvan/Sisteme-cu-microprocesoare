#int n;
#cin>>n;
#cout<<"Numarul:";
#for(int i=2; i<n; i++)
#if( n%i == 0 ) 
#cout<< i;

.data
mesajCitireN: .asciiz "Introdu nr: "
mesaj_rezultat: .asciiz "Divizorii sunt: "
mesaj_spatiu: .asciiz " "

.text
.globl main
main:
puts mesajCitireN
geti $t0 #n in t0
li $t1, 2 #i=2
puts mesaj_rezultat
for:
	div $t0, $t1
	mfhi $t3
	bgtz $t3, gata
	puti $t1
	puts mesaj_spatiu
	gata:
		addi $t1, $t1, 1 #trece la urmatorul divizor
		blt $t1, $t0, for #atata timp cat divizorul < n
	