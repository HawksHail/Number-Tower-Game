#Bradley Krakar
#Created 4/22/2018

.globl midi

.text
midi:
li $v0, 33 #syscall midi out with pitch 69, duration 200 miliseconds, piano, and volume 100
li $a0, 69
li $a1, 200
li $a2, 5
li $a3, 100
syscall

li $a0, 70#midi out pitch 70
syscall

li $a0, 71#midi out pitch 71
syscall

li $a0, 72#midi out pitch 72
syscall

li $a0, 61#midi out pitch 61
syscall

li $a0, 62#midi out pitch 62
syscall

li $a0, 63#midi out pitch 63
syscall

li $a0, 64#midi out pitch 64
syscall

li $a0, 65#midi out pitch 65
syscall

li $a0, 66#midi out pitch 66
syscall

li $a0, 67#midi out pitch 67
syscall

li $a0, 68#midi out pitch 68
syscall

jr $ra