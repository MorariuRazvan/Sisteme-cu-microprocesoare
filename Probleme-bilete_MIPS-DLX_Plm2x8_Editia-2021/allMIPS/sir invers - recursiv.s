.data
d3:	.asciiz "Dati un sir de caractere (sirul se incheie cu '0'): "
d4:	.asciiz "S-a tastat un sir vid !"
d5:	.asciiz "\nExecutia programului s-a incheiat !"
	.globl main

	.text
main:
	subu $sp, $sp, 12	
	sw $ra, 8($sp)		# se pastreaza adresa de revenire in programul 
# principal
	sw $fp, 4($sp)		# se pastreaza pe stiva indicatorul de cadru cu 
# valoarea din momentul inceperii executiei 
# programului
	addu $fp, $sp, 12	# se determina indicatorul de cadru
puts d3
	li $t0,-1		# prima citire de la tastatura

et:	
getc $a0		# se depune in a0 caracterul dorit
	add $t0, $t0, 1
	li $a1, 0x00000030	# codul ASCII al caracterului '0'
	beq $a0, $a1, afis1	# daca s-a tastat '0' atunci se indeplineste 
# conditia de iesire din recursivitate si se trece 
# la afisarea numerelor anterior citite
	jal inv			# Nu s-a tastat '0' => se continua cu apelul 
# recursiv
afis1:lw $a0, 0($fp)		# se preia in a0 caracterul ce va fi afisat
	lw $ra, 8($sp)		# se reface adresa de revenire din subrutina 
	lw $fp, 4($sp)		# se reface indicatorul de cadru
	addu $sp, $sp, 12	# se reface indicatorul de stiva
	add $t0, $t0, -1
        j afis
					# al rutinei de inversare

afis:
	putc $a0 		# dupa apel se face afisarea
	bne $t0, 0, more_write	# t0!=0 => mai sunt elemente de citit 
# din stiva si de afisat
	j end			# t0=0 => nu mai sunt elemente in stiva se va 
# afisa mesajul de sfarsit program

more_write:j $ra
	lw $a0, 0($fp)		# se preia in a0 caracterul ce va fi afisat
	lw $ra, 8($sp)		# se reface adresa de revenire din subrutina 
	lw $fp, 4($sp)		# se reface indicatorul de cadru
	addu $sp, $sp, 12	# se reface indicatorul de stiva
	add $t0, $t0, -1
	

inv:
	subu $sp, $sp, 12	# se determina cadrul de stiva
	sw $ra, 8($sp)		# se salveaza pe stiva adresa de revenire - ra �
# fiind o functie recursiva
	sw $fp, 4($sp)		# se salveaza indicatorul de cadru
	addu $fp, $sp, 12
	sw $a0, 0($fp)		# se salveaza pe stiva a0 (valoarea citita)
	j et

end:
puts d5			# afisare mesaj 'Executia programului s-a 
# incheiat!'
done

