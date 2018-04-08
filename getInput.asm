# Zion Mantey
# Created 4/8/18

# No input
# Returns label index in $v0
# Returns number in $v1

.data

.globl getInput
prompt: .asciiz "\nEnter the label:  "
prompt2: .asciiz "\nEnter the number:  "
error: .asciiz "\nAn invalid character was entered."

.text

getInput:
li $v0, 4		# print string, prompt
la $a0, prompt
syscall

li $v0, 12		# read char, label
syscall

addi $t0, $v0, -97
blt $t0, 0, printError		# value too low
bgt $t0, 27, printError		# value too high

li $v0, 4		# print string, prompt2
la $a0, prompt2
syscall

li $v0, 5		# read int, value
syscall

move $v1, $v0		# move label to return reg
move $v0, $t0		# move number to return reg
j exit

printError:
li $v0, 4		# print string, error
la $a0, error
syscall

restart:
j getInput		# restart

exit:
# li $v0, 10 		# exit		#UNCOMMENT THESE 2 LINES TO TEST
# syscall

jr $ra		# return