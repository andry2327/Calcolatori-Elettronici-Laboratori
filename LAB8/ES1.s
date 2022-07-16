.data

ora_in: .byte 12, 47
ora_out: .byte 18, 14
X: .byte 1
Y: .byte 40

.text
.globl main
.ent main

main:

la $a0, ora_in
la $a1, ora_out
lbu $a2, X
lbu $a3, Y
# offset dei 2 vettori (hh:mm)
lbu $t0, 0($a0)
lbu $t1, 0($a1)
sub $t0, $t1, $t0
lbu $t1, 1($a0)
lbu $t2, 1($a1)
sub $t1, $t2, $t1
move $a0, $t0
move $a1, $t1

jal costoParcheggio
move $a0, $v0
li $v0, 1
syscall
j done

costoParcheggio:
addi $t0, $0, 60
blt $a1, $0, toPos # setto l'offset corretto
next:
mult $a0, $t0
mflo $t0
add $t0, $t0, $a1 # carico in $t0 l'offset in minuti
div $t0, $a3
mflo $t1 # $t1 = n periodi
mfhi $t2 # $t2 = minuti in eccesso
mul $v0, $t1, $a2
bgt $t2, $0, isMin
next2:
jr $ra
j done

toPos:
addi $a1, $a1, 60
addi $a0, $a0, -1
j next

isMin:
addi $v0, $v0, 1
j next2


done:
li $v0, 10
syscall
