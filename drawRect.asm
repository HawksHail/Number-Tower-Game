# Luke Vanhaezebrouck
# Created 4/22/2018

.globl drawRect

.text
# ---------------------------------------------------- DRAW RECT ------------------------------------------------------
# --------------------- Args: $a0 = X, $a1 = width, $a2 = Y, $a3 = height | Vars: $s7 = color -------------------------
drawRect:		
la $t0, frameBuffer	# Set $t0 to buffer address

add $a1, $a1, $a0	# Set $a1 to X end point
add $a3, $a3, $a2	# Set $a3 to Y end point
sll $a0, $a0, 2		# Multiply X coords by 4 (4 bytes per pixel)
sll $a1, $a1, 2
sll $a2, $a2, 10	# Multiply Y coords by 1024 (256 pixels per row * 4 bytes per pixel)
sll $a3, $a3, 10

addu $t1, $a2, $t0	# Set $t1 to last column of first row (address)
addu $t1, $t1, $a1 	
addu $a2, $a2, $t0 	# Set $a2 to first column of first row (address)
addu $a2, $a2, $a0 	
addu $a3, $a3, $t0	# Set $a3 to first column of last row (address)
addu $a3, $a3, $a0

li $t2, 1024		# Set $t2 to size of a row of pixels

rowLoop:
move $t3, $a2		# Set $t3 to next row

columnLoop:
sw $s7, ($t3)		# Fill current pixel w/ color in $s7
addi $t3, $t3, 4	# Set $t3 to next column
bne $t3, $t1, columnLoop# Loop if current column is less than last column

add $a2, $a2, $t2 	# Set $a2 to next row
add $t1, $t1, $t2 	# Set $t1 to last column of next row
bne $a2, $a3, rowLoop	# Loop if current row is less than last row

jr $ra
