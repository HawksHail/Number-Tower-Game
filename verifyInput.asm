# Zion Mantey
# Created 4/8/18

# Input array in $a0
# 	index in $a1
#	number in $a2

# Output return code in $v0
# 0 = valid (some maybe empty though)
# 1 = invalid child
# 2 = invalid parent
# 3 = could not check children or parents (all empty entries)

# To get from a label to the two labels below it, subtract the row number from the index of the original label
# Top row is 1 and bottom row is 7

.data
float1: .float 1
float2: .float 2
#nums: .word 372, 191, 181, 101, 90, 0, 56, 0, 45, 46, 33, 23, 0, 23, 0, 20, 13, 10, 0, 11, 0, 10, 10, 3, 7, 0, 6, 6	#test array
.globl verifyInput

.text

#la $a0, nums	#test input
#jal printPyr
#la $a0, nums	#test input
#li $a1, 7	#test input
#li $a2, 6	#test input
#la $ra, exit


verifyInput:
move $t0, $a0		# save array
move $t1, $a1		# save index
move $t2, $a2		# save number
li $t5, 0		#initialize invalid counter to 0


calcRow:		# algorithm: int row = int((-1 + sqrt(1 + 8 * i)) / 2)   + 1	https://stackoverflow.com/questions/37513699/find-row-of-pyramid-based-on-index
sll $t3, $t1, 3		# multiply index by 8
addi $t3, $t3, 1	# add 1
mtc1 $t3, $f0
cvt.s.w $f0, $f0	# convert to float
sqrt.s $f0, $f0		# square root
lwc1 $f2, float1
sub.s $f0, $f0, $f2	# subtract 1
lwc1 $f4, float2
div.s $f0, $f0, $f4	# div by 2
floor.w.s $f0, $f0	# floor
mfc1 $t3, $f0		# move back to int

addi $t3, $t3, 1	#add 1 to start rows at 1

# check the children and parents and verify thay add together

#TODO Add checks for top and bottom of pyramid
bne $t3, 1, top	# if top of pyramid set flag to 1
li $t4, 1
addi $t5, $t5, 2	# add to skip count
j row
top:
bne $t3, 7, row	# if bottom of pyramid set flag to 2
li $t4, 2
addi $t5, $t5, 1	# add to skip count
j checkParent


row:
add $t7, $t1, $t3	# child index = index + row# 
sll $t7, $t7, 2		# convert index to offset
add $t7, $t7, $t0	# add array address
lw $t8, 0($t7)		# load child 1
lw $t9, 4($t7)		# load child 2

beq $t8, 0, skipChild	# if either child is 0, don't check and move on
beq $t9, 0, skipChild

add $t9, $t9, $t8		# add children together
bne $t9, $t2, invalidChild	# input was invalid


checkParent:
beq $t4, 1, done	# if top of pyramid, don't check parents

sub $t7, $t1, $t3	# parent index = index - row# 
sll $t7, $t7, 2		# convert index to offset
add $t7, $t7, $t0	# add array address

li $t9, 0	# index		Check if the index is on the right edge; it only has one parent to check
li $t8, 2	# counter
parentLoopRight:
beq $t1, $t9, oneParentRight	# check if index is equal to edge index
add $t9, $t9, $t8	# increment index
addi $t8, $t8, 1	# increment counter
blt $t8, 6, parentLoopRight

li $t9, 1	# index		Check if the index is on the left edge; it only has one parent to check
li $t8, 2	# counter
parentLoopLeft:
beq $t1, $t9, oneParentLeft
add $t9, $t9, $t8	# increment index
addi $t8, $t8, 1	# increment counter
blt $t8, 6, parentLoopLeft

			#else it has 2 parents

lw $t8, 0($t7)		# load parent 1
beq $t8, 0, skipParent1	# if parent 1 is 0 skip
lw $t9, 0($t0)		# load parent 1 other child
beq $t9, 0, skipParent1	# if parent 1 other child is 0 skip
add $t6, $t2, $t9	# new + parent 1 other child
bne $t6, $t8 invalidParent	# children do not add to parent

parent2:
lw $t8, 4($t7)			# load parent 2
beq $t8, 0, skipOnlyParent	# if parent 2 is 0 skip
lw $t9, 0($t0)			# load parent 2 other child
beq $t9, 0, skipOnlyParent	# if parent 2 other child is 0 skip
add $t6, $t2, $t9		# new + parent 2 other child
bne $t6, $t8 invalidParent	# children do not add to parent

done:
bge $t5, 3, unknown	# couldnt check anything, return unknown
j valid


oneParentRight:
lw $t8, 0($t7)			# load parent
beq $t8, 0, skipOnlyParent	# if parent is 0 skip
lw $t9, 0($t0)			# load parent other child
beq $t9, 0, skipOnlyParent	# if parent other child is 0 skip
add $t6, $t2, $t9		# new + parent other child
bne $t6, $t8 invalidParent	# children do not add to parent
j done

oneParentLeft:
lw $t8, 4($t7)			# load parent
beq $t8, 0, skipOnlyParent	# if parent is 0 skip
lw $t9, 0($t0)			# load parent other child
beq $t9, 0, skipOnlyParent	# if parent other child is 0 skip
add $t6, $t2, $t9		# new + parent other child
bne $t6, $t8 invalidParent	# children do not add to parent
j done

#exit:
#li $v0, 10 		# exit		
#syscall

skipChild:
addi $t5, $t5, 1	# add to skip count
j checkParent

skipParent1:
addi $t5, $t5, 1	# add to skip count
j parent2

skipOnlyParent:
addi $t5, $t5, 1	# add to skip count
j done

invalidChild:
li $v0, 1		# return with invalid code 1 (children do not add to input)
jr $ra

invalidParent:
li $v0, 2		# return with invalid code 2 (parent do not add to input)
jr $ra

unknown:
li $v0, 3		# return with invalid code 3 (children and parents could not be verified)
jr $ra

valid:
li $v0, 0		# return with code 0 (Everything worked out)
jr $ra