.data
a0: .word 107
b0: .word 21
c0: .word 3
s1: .asciiz "stampa variabili:\n"
s2: .asciiz "\n"

.text
.globl main
.ent main

main:
lbu $t0, a0 # caricamento var in memoria
lbu $t1, b0
lbu $t2, c0

bgt $t0, $t1, swap1
c2:
bgt $t0, $t2, swap2
c3:
bgt $t1, $t2, swap3
c4:
la $a0, s1  # print variabili
li $v0, 4
syscall
la $a0, s2  # print "\n"
li $v0, 4
syscall
move $a0, $t0
li $v0, 1
syscall
la $a0, s2  # print "\n"
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall
la $a0, s2  # print "\n"
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall
j done

swap1:
  move $t9, $t0
  move $t0, $t1
  move $t1, $t9
  j c2

swap2:
  move $t9, $t0
  move $t0, $t2
  move $t2, $t9
  j c3

swap3:
  move $t9, $t1
  move $t1, $t2
  move $t2, $t9
  j c4

done:
  li $v0, 10
  syscall
