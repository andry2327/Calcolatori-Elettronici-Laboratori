.data
DIM: .byte 5
inserisci: .asciiz "\nInserisci cifra:\n"

.text
.globl main
.ent main

main:

lb $t0, DIM # dichiaro DIM
addi $t1, $0, 0 # $t1: i=0

for:
beq $t1, $t0, printM

la $a0, inserisci
li $v0, 4
syscall

li $v0, 5
syscall
move $t2, $v0 # carico il char in $t2

add $t4, $t4, $t2 # sum = sum + $t2

addi $t1, $t1, 1
j for

printM:
div $t4, $t4, $t1
mflo $a0
li $v0, 1
syscall

done:
li $v0, 10
syscall
