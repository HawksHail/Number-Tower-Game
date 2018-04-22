# Zion Mantey
# Created 4/7/18

# Loads a random pyramid and returns the address in $v0
# The pyramid is loaded top to bottom, with index 0 being the top and 27 being the right bottom
# No input


.data
filename: .ascii  "Project\\Number-Tower-Game\\pyramids"	# path relative to MARS jar file
partFilename: .asciiz "\\pyramid?.dat"				# individual file to be read. Is randomized per run
.align 2							# align on word boundary
array: .space 112	# space for 28 words
file: .space 512	# input buffer
.globl load

.text
load:
addiu $sp, $sp, -4	# store 1 word on stack
sw $ra, 4($sp)      	# save $ra in the upper one

li $v0, 42		# random int with bounds
li $a1, 10		# maximum bound (not inclusive) i.e. [0,int)
syscall

addi $a0, $a0, 48	# add to ascii to get to numbers
sb $a0, partFilename + 8	# modify the byte of the pathname with the number

li $v0, 13		# open a file
la $a0, filename	# filename to load
li $a1, 0		# open in read only
li $a2, 0 		# unused mode
syscall

move $t9, $v0		# move file descriptor

li $v0, 14		# read from file
move $a0, $t9		# file descriptor to read from
la $a1, file		# input buffer
li $a2, 1024		# max number of characters to read
syscall

li $v0, 16		# close file
move $a0, $t9		# file descriptor
syscall

li $t7, 0 		# loop counter
li $t9, 0		# file offset
loop:

la $a0, file		# load file address
add $a0, $a0, $t9	# add file offset
la $at, atoi		# convert
jalr $at

add $t9, $t9, $v1 	# add file offest (number of characters used)
addi $t9, $t9, 2	# add \r\n chars to file offset

la $t8, array		# load array address
sll $t0, $t7, 2		# multiply index by 4
add $t8, $t8, $t0	# load array offest
sw $v0, 0($t8)

addi $t7, $t7, 1	# increment loop counter
bne $t7, 28, loop	# loop until all 28 numbers are read

lw $ra, 4($sp) 		# load return address
addiu $sp, $sp, 4	# restore $sp
la $v0, array		# load array address into $v0		#COMMENT THESE 2 LINES TO TEST
jr $ra			# return to caller

#li $v0, 10 		# exit					#UNCOMMENT THESE 2 LINES TO TEST
#syscall
