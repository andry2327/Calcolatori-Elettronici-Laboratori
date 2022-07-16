.data
s: .asciiz "inserisci char:\n"
cifra: .asciiz "\ncifra\n"
char: .asciiz "\nchar\n"
end: .asciiz "\nfine\n"

.text
.globl main
.ent main

main:



addi $t1, $0, 48
addi $t2, $0, 57
addi $t3, $0, 10

for:

addi $t0 $0, 0

la $a0, s
li $v0, 4
syscall

li $v0, 12
syscall

move $t0, $v0 # carico il char in $t0

beq    $t0, $t3, done  # if  ==  then

blt    $t0, $t1, c   # if  <  then
bgt    $t0, $t2, c  # if  >  then

la $a0, cifra
li $v0, 4
syscall
jfor:
j for

c:
la $a0, char
li $v0, 4
syscall
j jfor

done:
  la $a0, end
  li $v0, 4
  syscall
  li $v0, 10
  syscall
