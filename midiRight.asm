#Bradley Krakar & Zion Mantey
#Created 4/22/2018

.globl midiRight

.text
midiRight:
li $v0, 33 #syscall midi out with pitch 69, duration 200 miliseconds, piano, and volume 100
li $a0, 69
li $a1, 200
li $a2, 127
li $a3, 100
syscall

li $a0, 70#midi out pitch 70
syscall

li $a0, 71#midi out pitch 71
syscall

li $a0, 72#midi out pitch 72
syscall



jr $ra
