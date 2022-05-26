#Scrieţi un program care citeşte de la tastatură un număr natural n si afiseaza toate numerele perfecte mai mici decat n
# int main()
# {
# 	int n,s,j,i;
# 	cin>>n;
# 	for(i=1;i<=n;i++)
# 	{
# 		s=0;
# 		for(j=1;j<i;j++)
# 			if(i%j==0) s=s+j;
# 		if(s==i) cout<<i<<" ";
# 	}
# 	return 0;
# }

.data
mesajCitireN: .asciiz "Introdu nr: "
mesajNnegativ: .asciiz "N negativ!"
mesajSpatiu: .asciiz " "

.text
.globl main
main:
puts mesajCitireN
geti $t0 #n in t0
li $t1,0 #suma si negativ 
li $t2,1 #ct i
li $t3,1 #ct j
blt $t0, $t1, negativ
for_i:
    li $t1,0
    li $t3,1 #jul se face unu mereu
    for_j:
        div $t2,$t3
        mfhi $t4 #restul impartirii
        bnez $t4, continua
        add $t1,$t1,$t3
        continua:
        addi $t3,$t3,1 #j++
    blt $t3,$t2, for_j
    
    beq $t1,$t2, afisare_perfect
    increment:
    addi $t2,$t2,1 #i++
    ble $t2,$t0, for_i

done
afisare_perfect: 
    puti $t2
    puts mesajSpatiu
	b increment
negativ:
puts mesajNnegativ
done
