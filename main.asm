# Zion Mantey
# 4/21/18

.data
array: .space 112 	# pyramid array
invalidStr: .asciiz "\nThe input was invalid. "
.globl main
.text


main:
la $a0, array
jal load

move $s0, $v0

move $a0, $s0
jal printPyr

jal getInput

move $a0, $s0
move $a1, $v0
move $a2, $v1
jal verifyInput

bne $v0, 0, invalid
sll $t9, $a1, 2
add $t9, $t9, $a1
lw $a2, 0($t9)

move $a0, $s0
jal printPyr


invalid: 
li $v0, 4		# print string, prompt
la $a0, invalidStr
syscall


li $v0, 10 		# exit
syscall
