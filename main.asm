# Zion Mantey
# 4/21/18

.data
frameBuffer: .space 0x20000
invalidStr: .asciiz "\nThe input was invalid. "
filledStr: .asciiz "\nThe spot is already filled. "
notConfirmed: .asciiz "\nThe input was not entered. "

.globl frameBuffer
.globl main

.text
main:
jal drawPyr	# draw pyramid on bitmap
jal load

move $s0, $v0	# save pyramid address
start:
move $a0, $s0	# move pyramid address to a0 for print
jal printPyr	# print pyramid

jal drawNums	# draw numbers

jal getInput	# get user input

move $a0, $s0	# save user input
move $a1, $v0
move $a2, $v1
jal verifyInput	# check input
move $a0, $s0	# save user input

beq $v0, 1, alreadyfilled	# if input is invalid print error
beq $v0, 2, invalid		# if input is invalid print error

sll $t5, $a1, 2			# update pyramid to include 
add $t5, $t5, $s0
sw $a2, 0($t5)
jal midiRight
j checkDone



invalid: 
li $v0, 4		# print string, invalid
la $a0, invalidStr
syscall
jal midiWrong
j start


alreadyfilled: 
li $v0, 4		# print string, filled
la $a0, filledStr
syscall
jal midiWrong
j start


checkDone:
lw $t9, 0($s0)
beq $t9, 0, start

lw $t9, 4($s0)
beq $t9, 0, start

lw $t9, 8($s0)
beq $t9, 0, start

lw $t9, 12($s0)
beq $t9, 0, start

lw $t9, 16($s0)
beq $t9, 0, start

lw $t9, 20($s0)
beq $t9, 0, start

lw $t9, 24($s0)
beq $t9, 0, start

lw $t9, 28($s0)
beq $t9, 0, start

lw $t9, 32($s0)
beq $t9, 0, start

lw $t9, 36($s0)
beq $t9, 0, start

lw $t9, 40($s0)
beq $t9, 0, start

lw $t9, 44($s0)
beq $t9, 0, start

lw $t9, 48($s0)
beq $t9, 0, start

lw $t9, 52($s0)
beq $t9, 0, start

lw $t9, 56($s0)
beq $t9, 0, start

lw $t9, 60($s0)
beq $t9, 0, start

lw $t9, 64($s0)
beq $t9, 0, start

lw $t9, 68($s0)
beq $t9, 0, start

lw $t9, 72($s0)
beq $t9, 0, start

lw $t9, 76($s0)
beq $t9, 0, start

lw $t9, 80($s0)
beq $t9, 0, start

lw $t9, 84($s0)
beq $t9, 0, start

lw $t9, 88($s0)
beq $t9, 0, start

lw $t9, 92($s0)
beq $t9, 0, start

lw $t9, 96($s0)
beq $t9, 0, start

lw $t9, 100($s0)
beq $t9, 0, start

lw $t9, 104($s0)
beq $t9, 0, start

lw $t9, 108($s0)
beq $t9, 0, start

# Done
move $a0, $s0	#move pyramid address to a0 for print
jal printPyr	# print pyr
jal drawNums	# draw numbers
jal midiWin

li $v0, 10 		# exit
syscall
