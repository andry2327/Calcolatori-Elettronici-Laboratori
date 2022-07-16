.data
op1: .byte 150
op2: .byte 100

.text
.globl main
.ent main

main:

lbu $t0, op1 # load byte unsigned: 150 = 10010110 = -106 in ca2 -> lo salvo come numero senza segno
lbu $t1, op2
add $a0, $t0, $t1
sb $a0, op1

li $v0, 1
syscall

li $v0, 10
syscall
.end main
