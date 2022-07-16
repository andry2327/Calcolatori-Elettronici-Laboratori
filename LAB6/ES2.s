.data

s: .asciiz "\ninserisci int TR: "
s1: .asciiz "\ninserisci int QU: "
nl: .asciiz "\n"
ast: .asciiz "* "

.text
.globl main
.ent main

main:
la $a0, s # stampo s
li $v0, 4
syscall
li $v0, 5
syscall
move $a0, $v0 # $t0 = DIM TR
jal triangolo
la $a0, s1 # stampo s1
li $v0, 4
syscall
li $v0, 5
syscall
move $a0, $v0 # $t1 = DIM QU
jal quadrato
j done

triangolo:

addi $t0, $0, 0 #i=1
addi $t1, $0, 0 #j=0
move $t2, $a0

forT:
bge $t0, $t2, exitT

forPrint:
bgt $t1, $t0, add_i

la $a0, ast # stampo *
li $v0, 4
syscall
addi $t1, $t1, 1
j forPrint
add_i:
la $a0, nl # stampo \n
li $v0, 4
syscall
addi $t1, $0, 0 # azzero 0
addi $t0, $t0, 1
j forT

exitT:
jr $ra

quadrato:

addi $t0, $0, 0 #i=1
addi $t1, $0, 0 #j=0
move $t2, $a0

forQ:
bge $t0, $t2, exitQ

forPrintQ:
bge $t1, $t2, add_iQ

la $a0, ast # stampo *
li $v0, 4
syscall
addi $t1, $t1, 1
j forPrintQ
add_iQ:
la $a0, nl # stampo \n
li $v0, 4
syscall
addi $t1, $0, 0 # azzero 0
addi $t0, $t0, 1
j forQ

exitQ:
jr $ra

done:
  li $v0, 10
  syscall
