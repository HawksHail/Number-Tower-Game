# Zion Mantey
# Created 4/8/18

# Input array in $a0
# 	index in $a1
#	number in $a2

# To get from a label to the two labels below it, subtract the row number from the index of the original label
# Top row is 1 and bottom row is 7

.data
float1: .float 1
float2: .float 2
nums: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28	#test array

.text

la $a0, nums	#test input
li $a1, 3
li $a2, 6

verifyInput:
move $t0, $a0		# save array
move $t1, $a1		# save index
move $t2, $a2		# save number

calcRow:		# algorithm: int row = int((-1 + sqrt(1 + 8 * i)) / 2);
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

#TODO check the indexes above and below and verify thay add together


li $v0, 10 		# exit		
syscall

