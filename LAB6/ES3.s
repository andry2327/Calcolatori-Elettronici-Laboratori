.data

str: .asciiz "mystring"

.text
.globl main
.ent main

main:

la $t3, str
addi $t2, $0, 10

for:

lb $a0, 0($t3)
beq $a0, $t2, done
jal toUpper
move $a0, $v0
li $v0, 11
syscall
addi $t3, $t3, 1 # il char successivo si trova nel byte successivo -> pos+1
j for

toUpper:
move $t0, $a0
addi $v0, $t0, -32
jr $ra

done:
  li $v0, 10
  syscall
