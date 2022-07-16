.data

matrix:

.word 10 , 20 , 30 , 40 , 50 , 60
.word 70 , 80 , 90 , 100 , 110 , 120

.text
.globl main
.ent main

main:

la $t0, matrix
addi $t1, $0, 3 #selezione colonna
addi $t4, $0, 2 # max righe
addi $t5, $0, 0 # i=0
addi $t7, $0, 0 # counter
li $t2, 4 # n bytes
mult  $t2, $t1      #  *  = Hi and Lo registers
mflo  $t1          # copy Lo to
add $t0, $t0, $t1 # indirizzo da cui partire in $t0

for:
 beq $t5, $t4, print

 lw $t6, ($t0)
 add $t7, $t7, $t6

 addi $t0, $t0, 24
 addi $t5, $t5, 1
j for

print:
addi $a0, $t7, 0
li $v0, 1
syscall

done:
li $v0, 10
syscall
