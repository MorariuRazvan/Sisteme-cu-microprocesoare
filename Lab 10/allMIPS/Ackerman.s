# algoritm 
#    if (m == 0){
#       return n + 1;
#   }
#    else if((m > 0) && (n == 0)){
#        return ack(m - 1, 1);
#    }
#    else if((m > 0) && (n > 0)){
#        return ack(m - 1, ack(m, n - 1));
#    }

 
.data
citireM: .asciiz " m = "
citireN: .asciiz " n = "
afisare: .asciiz " Ack(m,n) = "
.text
.globl main
main:
#citire m
puts citireM
geti $a0 #m

#citire n
puts citireN
geti $a1 #n

jal Ackerman
puts afisare
puti $v1 
done

# procedura Ackerman 
#Ack(m,n)={ n+1, daca m=0
#           A(m-1, n), daca m>0, n=0
#           A(m-1,A(m,n-1)), daca m>0, n>0
#         }
# parametri: a0 = m, a1 = n
# retureaza in v1 rezultatul

Ackerman:	
	beqz $a0, caz1
	#------------
	sgt $t0,$a0,0 #indicator de conditie, m>0
	seq $t1,$a1,0 #indicator de cond n=0
	and $t2,$t0,$t1
	bnez $t2, caz2 #daca e 1 rezultatul &&
	#------------
	sgt $t0,$a0,0 #indicator de conditie, m>0
	sgt $t1,$a1,0 #indicator de cond n=0
	and $t2,$t0,$t1
	bnez $t2, caz3 #daca e 1 rezultatul &&
caz1:
	addi $v0,$a1,1
	b sfarsit
caz2:
	sub $a0, $a0,1
	jal Ackerman
    j sfarsit   
caz3:
	#A(m,n-1)
	sub $a1, $a1,1 #n
	move $t3,$a0 #m - in caz ca il pierdem
	jal Ackerman
	move $a0,$t3 #restaurez m-ul
	sub $a0, $a0,1 #m-1
	#n == rezultatul de la ackermanul precedent
	move $a1,$v0 #rezultatul de la ultimul ackerman 
	jal Ackerman
sfarsit:
jr $ra
