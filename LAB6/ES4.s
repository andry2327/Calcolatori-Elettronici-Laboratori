.data

array: .word 4, 112, 56, 78, 34, 98, 12
str: .asciiz "mystring"

.text
.globl main
.ent main

main:

la $t0, array
addi $a1, $0, 7 # salvo lunghezza del vettore
addi $t1, $0, 0
addi $t3, $0, 0 # max

for:

beq $t1, $a1, printmax
la $a0, 0($t0)
jal massimo
addi $t0, $t0, 4
addi $t1, $t1, 1
j for

printmax:
move $a0, $v0
li $v0, 1
syscall
j done

massimo:
lw $t2, 0($a0)
bgt $t2, $t3, isMax
jr $ra

isMax:
addi $t3, $t2, 0
addi $v0, $t2, 0 # salvo il max
jr $ra

done:
  li $v0, 10
  syscall
