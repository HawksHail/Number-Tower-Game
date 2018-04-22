#Created By Bradley Krakar
#4/22/2018

.globl verifyInput
#input address in $a0
#input index in $a1
#input value in $a2
#verify code in $v0
#1 means the intended location is filled
#2 means the value is wrong for the intended location
#0 means the value is valid

.text
verifyInput:
sll $t1, $a1, 2 #shifts index to offset
add $t1, $a0, $t1 #adds offset to array address
lw $t2, 0($t1)

bne $t2, $zero, invalidIsFilled #if the value at the intended location is not zero, then the input is invalid

addi $t3, $t1, 112 #adds 112 to the address of the unsolved array value to reach the solved value
lw $t4, 0($t3) #loads the value at the index of the solved array
bne $t4, $a2, invalidIsWrong #if the input is not the same as the solved value, then the answer is wrong

addi $v0, $zero, 0 #else the input is correct
end:jr $ra

invalidIsFilled:
addi $v0, $zero, 1
j end

invalidIsWrong:
addi $v0, $zero, 2
j end