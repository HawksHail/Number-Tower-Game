# Bradley Krakar & Zion Mantey
# Created 4/22/2018

.globl midiWrong

.text
midiWrong:
li $v0, 33 #syscall midi out with pitch 69, duration 200 miliseconds, piano, and volume 100
li $a0, 68
li $a1, 300
li $a2, 5
li $a3, 100
syscall

li $a0, 70	#midi out pitch 70
syscall

li $a1, 500
li $a0, 47	#midi out pitch 71
syscall

jr $ra
