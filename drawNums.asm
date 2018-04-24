# Luke Vanhaezebrouck
# Created 4/22/2018

.data
numColor: .word 0xffffff	# White
answerColor: .word 0x418041	# Green (lighter green: 0x82ff82)
blankColor: .word 0xbf6034 	# Orange (light yellow: 0xffff82, dark yellow: 0xbfbf61)
# Box Width = 22, Box Height = 8
boxX: .word 117, 106, 128, 95, 117, 139, 84, 106, 128, 150, 73, 95, 117, 139, 161, 62, 84, 106, 128, 150, 172, 51,  73,  95,  117, 139, 161, 183
boxY: .word 2,   19,  19,  36, 36,  36,  53, 53,  53,  53,  70, 70, 70,  70,  70,  87, 87, 87,  87,  87,  87,  104, 104, 104, 104, 104, 104, 104

.globl drawNums

.text
# -------------------------------- DRAW NUMS -----------------------------------
# --------------------- Vars: $s0 = num array address -------------------------
drawNums:
move $t7, $ra		# Set $t7 to return address
li $t6, 112		# Set $t6 to array size (28 x 4 bytes)
li $t9, 0		# Set $t9 to index
la $s1, boxX		# Set $s1 to boxesX array address
la $s2, boxY		# Set $s2 to boxesY array address

loop:
beq $t9, $t6, return	# Exit loop if index is out-of-bounds
add $t8, $t9, $s0	# Set $t8 to num in array (address)
lw $t8, ($t8)		# Set $t8 to num in array

add $s3, $t9, $s1	# Set $s3 to X in array (address)
lw $s3, ($s3)		# Set $s3 to X in array	
add $s4, $t9, $s2	# Set $s4 to Y in array (address)
lw $s4, ($s4)		# Set $s4 to Y in array

beq $t8, $zero, blank	# Draw blank if 0
j answer		# Else, draw answer

blank:
lw $s7, blankColor

addi $a0, $s3, 1	
li $a1, 21
addi $a2, $s4, 1
li $a3, 7
jal drawRect		# Fill blank box
j next

answer:
lw $s7, answerColor

addi $a0, $s3, 1	
li $a1, 21
addi $a2, $s4, 1
li $a3, 7
jal drawRect		# Fill answer box

lw $s7, numColor
addi $s3, $s3, 17
addi $s4, $s4, 2
j numLoop		# Draw number

numLoop:
li $t0, 10
div $t8, $t0		# Divide num by 10
mfhi $t1		# Set $t1 to digit

beq $t1, $zero, drawZero
li $t0, 1
beq $t1, $t0, drawOne
li $t0, 2
beq $t1, $t0, drawTwo
li $t0, 3
beq $t1, $t0, drawThree
li $t0, 4
beq $t1, $t0, drawFour
li $t0, 5
beq $t1, $t0, drawFive
li $t0, 6
beq $t1, $t0, drawSix
li $t0, 7
beq $t1, $t0, drawSeven
li $t0, 8
beq $t1, $t0, drawEight
li $t0, 9
beq $t1, $t0, drawNine

nextDigit:
mflo $t2		# Set $t2 to remaining num

beq $t2, $zero, next	# Exit numLoop if remaining nums is 0
subi $s3, $s3, 5	
move $t8, $t2		# Set $t8 to remaining num
j numLoop

next:
addi $t9, $t9, 4	# Increment index by 1 (4 bytes)
j loop

return:
jr $t7


# ----------------------------- DRAW 0-9 --------------------------------
# --------------------- Vals: $s3 = X, $s4 = Y --------------------------
drawZero:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawOne:
addi $a0, $s3, 1
li $a1, 2
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 2
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 1
li $a1, 3
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawTwo:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 2
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawThree:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 1
li $a1, 3
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawFour:
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect

j nextDigit

drawFive:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 2
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawSix:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 2
li $a3, 3
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawSeven:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect

j nextDigit

drawEight:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 4
li $a3, 1
jal drawRect

j nextDigit

drawNine:
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 0
li $a3, 1
jal drawRect
addi $a0, $s3, 0
li $a1, 1
addi $a2, $s4, 0
li $a3, 3
jal drawRect
addi $a0, $s3, 3
li $a1, 1
addi $a2, $s4, 0
li $a3, 5
jal drawRect
addi $a0, $s3, 0
li $a1, 4
addi $a2, $s4, 2
li $a3, 1
jal drawRect

j nextDigit
