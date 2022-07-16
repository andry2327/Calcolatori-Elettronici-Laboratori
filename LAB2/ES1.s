.data
s1: .asciiz "pari"
s2: .asciiz "dispari"

.text
.globl main
.ent main

main:
li $v0, 5
syscall
# la $t0, $v0 copia l'indirizzio, non il valore
addu $t0, $v0, $0

and $t3, $t0, 1
beq $t3, $0, true
la $a0, s2
li $v0, 4
syscall
j done

true:
  la $a0, s1
  li $v0, 4
  syscall

done:
  li $v0, 10
  syscall

.end main
