.data
e1: .asciiz "errore coglione"
y1: .asciiz "giusto, fanculo l'expressione"
n: .byte 255
.text
.globl main
.ent main

main:
li $v0, 5
syscall
addu $t0, $v0, $0
li $v0, 5
syscall
addu $t1, $v0, $0

lbu $t3, n
addu $t2, $t3, $0
ble $t0, $t2, true1
j false

true1:
  ble $t1, $t2, exp
  j false

exp:

  #bitwise richiesto

  xor $t3, $t0, $t1 # A XOR B
  nor $t1, $t1, $t1 # NOT(B)
  and $t0, $t0, $t1 # A AND (NOT(B))
  nor $t0, $t0, $t0  # NOT (A AND (NOT(B)))
  or $t0, $t0, $t3 # (NOT (A AND (NOT(B)))) OR (A XOR B)

  move $a0, $t0
  li $v0, 1
  syscall
  j done

false:
  la $a0, e1
  li $v0, 4
  syscall
  j done

done:
  li $v0, 10
  syscall
