.data

n: .word 3141592653
s: .asciiz "cifre: "

.text
.globl main
.ent main

main:

#addu $t0, $0, 314#1592653
addi $t1, $0, 10
addi $t5, $0, 0
lw $t0, n # n = 3141592653
#addu $t0, $t0, $0
# $t3 = resto della divisione
for:
divu $t0, $t1
mfhi $t3
mflo $t0
beq $t3, $0, printS

subu $sp, $sp, 4 # push in stack
sw $t3, ($sp)
addi $t5, $t5, 1 # i++
j for

printS: # stampo stack
la $a0, s # stampo "cifra: "
li $v0, 4
syscall
addi $t6, $0, 0# j=0
printS1:
beq $t5, $t6, done

lw $t4, ($sp) # pop in stack
addu $sp, $sp, 4

add $a0, $t4, '0'
# carico il char corrispondente al numero
li $v0, 11
syscall

addi $t6, $t6, 1
j printS1

done:
  li $v0, 10
  syscall
