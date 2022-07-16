.data
giorni: .byte 1
ore: .byte 2
minuti: .byte 3
T0: .byte 76
risultato: .word 0

.text
.globl main
.ent main

main:

lb $t0, giorni # per i numeri uso lb
lb $t1, ore
lb $t2, minuti
lb $t3, risultato
lb $t4, T0

addi $t5, $0, 1440
addi $t6, $0, 60

mult $t0, $t5
mflo $t0
#or $t0, $t0, hi
mult $t1, $t6
mflo $t1
#or $t1, $t1s, hi
add $t0, $t0, $t1 # giorni + ore
add $t3, $t0, $t2 # giorni + ore + minuti = risultato
sub $t3, $t3, $t4 # ris = ris - T0

move $a0, $t3
li $v0, 1
syscall
