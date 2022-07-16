.data
n: .word 7
hw: .byte 16 # .half per le halfword

.text
.globl main
.ent main


# hw: 16 = $t0
# i = $t1
# var sll = $t2
# count = $t3
# n = $t4

main:

lbu $t0, hw
add $t1, $t1, $0
addi $t2, $0, 1
add $t3, $t3, $0
lbu $t4, n

for: beq $t1, $t0, print # i=16 ?

  add $t5, $0, $0 # azzro $t5 = ris and
  and $t5, $t4, $t2 # mascheramento bits: sfrutto seq
  #in $t5 trovo $t2 (int) se vero, 0 se falso
  beq $t5, $t2, count
  next:
  sll $t2, $t2, 1 # sll di 1 in $t2
  addi $t1, $t1, 1 # i++
  j for

count:
  addi $t3, $t3, 1
  j next

print:
  move $a0, $t3
  li $v0, 1
  syscall
  j done # superfluo

done:
  li $v0, 10
  syscall
