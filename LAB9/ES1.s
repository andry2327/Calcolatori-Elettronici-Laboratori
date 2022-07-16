DIM = 3
DIM_RIGA = DIM * 4

.data
mat1: .word 4, -45, 15565,   6458, 4531, 124,  -548, 2124, 31000
mat2:  .word 6, -5421, -547,   -99, 4531, 1456,  4592, 118, 31999
indice: .word 2
vet_out .space DIM_RIGA

.text
.globl main

main:

subu $sp, $sp, 4
sw $ra, ($sp)

la $a0, mat1
la $a1, mat2
la $a2, vet_out
li $a3, DIM
subu $sp, $sp, 4
lw $t0, indice
sw  $t0, ($sp)
jal ProceduraVariazione

lw $ra , ($sp)
addiu $sp, $sp, 4


.ent main

# $a0 = ind. mat1, # $a1 = ind. mat2, # $a2 = ind. vet_out, # $a3 = DIM vet_out,
# sp: $ra, indice

ProceduraVariazione:

addi $t4, $0, 4 # dim word
addi $t6, $0, 100

lw $t0, ($sp) #salvo in $t0 l'indice 2
add $sp, $sp, 4

mul $a3, $t0
mflo $t3
mul $t3, $t4
mflo $t3

addi $t1, $a0, $0 # $t1 indirizzo mat 1
add $t1, $t1, $t3 # indirizzo partenza $t1

mult $t0, $t4
mflo $t3

addi $t2, $a1, $0 # $t2 indirizzo mat 2
add $t2, $t2, $t3 # indirizzo partenza $t2

addi $t5, $t5, 0 #indice matrice

for:
beq $t5, $a3, endFor

sub $t3, $t2, $t1
mult $t3, $t6
mflo $t3
div $t3, $t1
mflo $t3

sw $t3, ($a2)

addi $a2, $a2, 4
addi $t1, $t1, 4 #aggiornamenrto posizioni e indice
mult $a3, $t4
mflo $t3
add $t2, $t2, $t3
addi $t5, $t5, 1

endFor:
addi $v0, $a2, 0
jr $ra
