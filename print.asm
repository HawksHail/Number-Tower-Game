#Zion Mantey
#3/18/18

# import with -> .include "print.asm"
# Address of array goes in $a0
# Call printPyr to use (jal printPyr)

.data	
.align 2 #align on word boundries
nums: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28	#test array
row7: .asciiz  "\n                                    "
row6: .asciiz  "\n                              "
row5: .asciiz  "\n                        "
row4: .asciiz  "\n                  "
row3: .asciiz  "\n            "
row2: .asciiz  "\n      "
row1: .asciiz  "\n"
space: .asciiz "        "

.globl printPyr


.text
la $a0, nums	#load address of array into arg0 for testing
la $ra, bottom	#drop off bottom for testing

printPyr: 
	move $t0, $a0 	#move array address to $t0
	li $t9, 27	#index of array

print7:	li $v0, 4	#syscall print row 7 string
	la $a0, row7
	syscall
	j cont

print6:	li $v0, 4	#syscall print row 6 string
	la $a0, row6
	syscall
	j cont
	
print5:	li $v0, 4	#syscall print row 6 string
	la $a0, row5
	syscall
	j cont
	
print4:	li $v0, 4	#syscall print row 6 string
	la $a0, row4
	syscall
	j cont
	
print3:	li $v0, 4	#syscall print row 6 string
	la $a0, row3
	syscall
	j cont
	
print2:	li $v0, 4	#syscall print row 6 string
	la $a0, row2
	syscall
	j cont
	
print1:	li $v0, 4	#syscall print row 6 string
	la $a0, row1
	syscall
	j cont
	
	
printNum:
	beq $t9, 26, print6
	beq $t9, 24, print5
	beq $t9, 21, print4
	beq $t9, 17, print3
	beq $t9, 12, print2
	beq $t9, 6, print1
cont:	li $v0, 4	#syscall print string
	la $a0, space	#print spacing
	syscall
	
	li $v0, 11	#syscall print  char
	addi $t6, $t9, 97	#add 97 to index to get alpha
	move $a0, $t6	#print alpha label
	syscall
		
	li $a0, 41	#print )
	syscall
	
	sll $t8, $t9, 2		#mult index by 4
	add $t1, $t0, $t8	#add offset to address
	lw $t7, 0($t1)	#load at index to $t7
	
	bgt $t7, 9, great	#if number is less than 9, print an extra space for alignment
	li $v0, 11	#syscall print  char
	li $a0, 32	#print space
	syscall	
	
great:	li $v0, 1	#syscall print int
	move $a0, $t7	#move int to $a0
	syscall
	
	addi $t9, $t9, -1	#decrement index
	
	beq $t9, -1, Exit	#if index is -1 exit
	j printNum

Exit:	jr $ra
bottom: