#Calculati factorialul unui numar n
#Factorial(n)
#{ 
# if(n>0)
#     return n*Factorial(n-1)
#else return 1
#}
.data

	mesajIntroducetiN: .asciiz "Introduceti n: "
	mesajFactorial: .asciiz "\nFactorialul este: "

main:
puts mesajCitire
get $t0 #t0<-n

li $t1, 1
jal factorial 
puts mesajFactorial
puti $t1 #in t1 intoarcem rezultatul
done

#un fel de procedura care trebe sa se termine cu jr $ra - care e adresa de revenire
factorial:
mul $t1,$t1,$t0 
sub $t0,$t0,1 # n-1
bgtz $t0, factorial # if(n>0) si revenim cu n-1
jr $ra