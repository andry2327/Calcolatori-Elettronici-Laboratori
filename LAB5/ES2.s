.data

vett: .space 80
n: .word 3141592653
s: .asciiz "\ninserisci char: "
s1: .asciiz "\parola palindroma "
s2: .asciiz "\nparola non palindroma "

.text
.globl main
.ent main

main:
addi $t5, $0, 0 # i=0
la $t0, ($sp) # indirizzo iniziale di sp

for:
la $a0, s # stampo s
li $v0, 4
syscall
li $v0, 12
syscall
beq $v0, 10, exit_for
subu $sp, $sp, 4 # push in stack
sw $v0, ($sp)
addi $t5, $t5, 1 # i++
j for

la $t1, ($sp) # indirizzo finale di sp
addi $t7, $0, 2
div $t5, $t7
mflo $t6
addi $t5, $0, 0 # i=0

exit_for:
beq $t6, $t5, pal
lw $t3, ($t0) # pop in stack
sub $t0, $t0, 4
lw $t4, ($t1) # pop in stack
addu $t1, $t1, 4
bne $t3, $t4, not_pal
addi $t6, $t6, 1
j exit_for

pal:
la $a0, s1
li $v0, 4
syscall
j done

not_pal:
la $a0, s2
li $v0, 4
syscall
j done

done:
  li $v0, 10
  syscall
