.data
vett: .space 80
val1: .word 1
val2: .word 1
space: .asciiz "\n"

.text
.globl main
.ent main

main:

la $t6, vett
addi $t0, $0, 2 # i = 2
addi $t1, $0, 20
lb $t3, val1
lb $t4, val2

sw $t3, 0($t6)
sw $t4, 4($t6)

for:
beq $t0, $t1, done

lw $t5, ($t6)
add $t5, $t4, $t3
sw $t5, ($t6)

move $a0, $t5
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

add $t3, $t4, $0
add $t4, $t5, $0

addi $t6, $t6, 4 # aggiorno indirizzo memoria
addi $t0, $t0, 1 # i++
j for

done:
  li $v0, 10
  syscall
