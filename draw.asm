# Luke Vanhaezebrouck
# Created 4/22/2018

.data
boxColor: .word 0xffffff	# White
letColor: .word 0xffffff	# White
# Box Width = 22, Box Height = 8
boxX: .word 117, 106, 128, 95, 117, 139, 84, 106, 128, 150, 73, 95, 117, 139, 161, 62, 84, 106, 128, 150, 172, 51,  73,  95,  117, 139, 161, 183
boxY: .word 2,   19,  19,  36, 36,  36,  53, 53,  53,  53,  70, 70, 70,  70,  70,  87, 87, 87,  87,  87,  87,  104, 104, 104, 104, 104, 104, 104

.globl drawPyr

.text
# ---------------- DRAW PYRAMID -------------------
# -------------------------------------------------
drawPyr:
move $t4, $ra	# Set $t4 to return address
la $s1, boxX	# Set $s1 to boxX array address
la $s2, boxY	# Set $s2 to boxY array address
lw $s7, boxColor	

lw $a0, ($s1)
lw $a2, ($s2)
jal drawBox	# Draw Box A
lw $a0, ($s1)
lw $a2, ($s2)
jal drawA	# Draw Lable A

lw $a0, 4($s1)
lw $a2, 4($s2)
jal drawBox	# Draw Box B
lw $a0, 4($s1)
lw $a2, 4($s2)
jal drawB	# Draw Lable B
lw $a0, 8($s1)
lw $a2, 8($s2)
jal drawBox	# Draw Box C
lw $a0, 8($s1)
lw $a2, 8($s2)
jal drawC	# Draw Lable C

lw $a0, 12($s1)
lw $a2, 12($s2)
jal drawBox	# Draw Box D
lw $a0, 12($s1)
lw $a2, 12($s2)
jal drawD	# Draw Lable D
lw $a0, 16($s1)
lw $a2, 16($s2)
jal drawBox	# Draw Box E
lw $a0, 16($s1)
lw $a2, 16($s2)
jal drawE	# Draw Lable E
lw $a0, 20($s1)
lw $a2, 20($s2)
jal drawBox	# Draw Box F
lw $a0, 20($s1)
lw $a2, 20($s2)
jal drawF	# Draw Lable F

lw $a0, 24($s1)
lw $a2, 24($s2)
jal drawBox	# Draw Box G
lw $a0, 24($s1)
lw $a2, 24($s2)
jal drawG	# Draw Lable G
lw $a0, 28($s1)
lw $a2, 28($s2)
jal drawBox	# Draw Box H
lw $a0, 28($s1)
lw $a2, 28($s2)
jal drawH	# Draw Lable H
lw $a0, 32($s1)
lw $a2, 32($s2)
jal drawBox	# Draw Box I
lw $a0, 32($s1)
lw $a2, 32($s2)
jal drawI	# Draw Lable I
lw $a0, 36($s1)
lw $a2, 36($s2)
jal drawBox	# Draw Box J
lw $a0, 36($s1)
lw $a2, 36($s2)
jal drawJ	# Draw Lable J

lw $a0, 40($s1)
lw $a2, 40($s2)
jal drawBox	# Draw Box K
lw $a0, 40($s1)
lw $a2, 40($s2)
jal drawK	# Draw Lable K
lw $a0, 44($s1)
lw $a2, 44($s2)
jal drawBox	# Draw Box L
lw $a0, 44($s1)
lw $a2, 44($s2)
jal drawL	# Draw Lable L
lw $a0, 48($s1)
lw $a2, 48($s2)
jal drawBox	# Draw Box M
lw $a0, 48($s1)
lw $a2, 48($s2)
jal drawM	# Draw Lable M
lw $a0, 52($s1)
lw $a2, 52($s2)
jal drawBox	# Draw Box N
lw $a0, 52($s1)
lw $a2, 52($s2)
jal drawN	# Draw Lable N
lw $a0, 56($s1)
lw $a2, 56($s2)
jal drawBox	# Draw Box O
lw $a0, 56($s1)
lw $a2, 56($s2)
jal drawO	# Draw Lable O

lw $a0, 60($s1)
lw $a2, 60($s2)
jal drawBox	# Draw Box P
lw $a0, 60($s1)
lw $a2, 60($s2)
jal drawP	# Draw Lable P
lw $a0, 64($s1)
lw $a2, 64($s2)
jal drawBox	# Draw Box Q
lw $a0, 64($s1)
lw $a2, 64($s2)
jal drawQ	# Draw Lable Q
lw $a0, 68($s1)
lw $a2, 68($s2)
jal drawBox	# Draw Box R
lw $a0, 68($s1)
lw $a2, 68($s2)
jal drawR	# Draw Lable R
lw $a0, 72($s1)
lw $a2, 72($s2)
jal drawBox	# Draw Box S
lw $a0, 72($s1)
lw $a2, 72($s2)
jal drawS	# Draw Lable S
lw $a0, 76($s1)
lw $a2, 76($s2)
jal drawBox	# Draw Box T
lw $a0, 76($s1)
lw $a2, 76($s2)
jal drawT	# Draw Lable T
lw $a0, 80($s1)
lw $a2, 80($s2)
jal drawBox	# Draw Box U
lw $a0, 80($s1)
lw $a2, 80($s2)
jal drawU	# Draw Lable U

lw $a0, 84($s1)
lw $a2, 84($s2)
jal drawBox	# Draw Box V
lw $a0, 84($s1)
lw $a2, 84($s2)
jal drawV	# Draw Lable V
lw $a0, 88($s1)
lw $a2, 88($s2)
jal drawBox	# Draw Box W
lw $a0, 88($s1)
lw $a2, 88($s2)
jal drawW	# Draw Lable W
lw $a0, 92($s1)
lw $a2, 92($s2)
jal drawBox	# Draw Box X
lw $a0, 92($s1)
lw $a2, 92($s2)
jal drawX	# Draw Lable X
lw $a0, 96($s1)
lw $a2, 96($s2)
jal drawBox	# Draw Box Y
lw $a0, 96($s1)
lw $a2, 96($s2)
jal drawY	# Draw Lable Y
lw $a0, 100($s1)
lw $a2, 100($s2)
jal drawBox	# Draw Box Z
lw $a0, 100($s1)
lw $a2, 100($s2)
jal drawZ	# Draw Lable Z
lw $a0, 104($s1)
lw $a2, 104($s2)
jal drawBox	# Draw Box {
lw $a0, 104($s1)
lw $a2, 104($s2)
jal drawBracket	# Draw Lable {
lw $a0, 108($s1)
lw $a2, 108($s2)
jal drawBox	# Draw Box |
lw $a0, 108($s1)
lw $a2, 108($s2)
jal drawPipe	# Draw Lable |

jr $t4


# -------------------- DRAW BOX -----------------------
# ------------- Args: $a0 = X, $a2 = Y ----------------
drawBox:
move $t5, $a0	# Set $t5 to X
move $t6, $a2	# Set $t6 to Y
move $t7, $ra	# Set $t7 to return address

li $a1, 23
li $a3, 1
jal drawRect	# Draw Top

move $a0, $t5
li $a1, 1
move $a2, $t6
li $a3, 9
jal drawRect	# Draw Left

addi $a0, $t5, 22
li $a1, 1
move $a2, $t6
li $a3, 9
jal drawRect	# Draw Right

move $a0, $t5
li $a1, 23
addi $a2, $t6, 8
li $a3, 1
jal drawRect	# Draw Bottom

jr $t7


# ---------------------------- DRAW A-| --------------------------------
# --------------------- Args: $a0 = X, $a2 = Y -------------------------
drawA:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 2
li $a3, 1
jal drawRect

jr $t7

drawB:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawC:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawD:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 1
li $a3, 4
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawE:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawF:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 2
li $a3, 1
jal drawRect

jr $t7

drawG:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 2
li $a3, 3
jal drawRect
addi $a0, $t5, 2
li $a1, 2
addi $a2, $t6, 2
li $a3, 1
jal drawRect

jr $t7

drawH:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 2
li $a3, 1
jal drawRect

jr $t7

drawI:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 1
li $a1, 3
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 1
li $a1, 3
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawJ:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect

jr $t7

drawK:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect

jr $t7

drawL:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawM:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 1
li $a3, 2
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect

jr $t7

drawN:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 1
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect

jr $t7

drawO:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawP:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 3
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 2
li $a3, 1
jal drawRect

jr $t7

drawQ:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 3
li $a3, 1
jal drawRect

jr $t7

drawR:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect

jr $t7

drawS:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 3
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 2
li $a3, 3
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawT:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 1
li $a1, 3
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect

jr $t7

drawU:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 0
li $a1, 3
addi $a2, $t6, 4
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect

jr $t7

drawV:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 0
li $a3, 4
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 4
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 4
jal drawRect

jr $t7

drawW:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect
addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 2
li $a3, 2
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 5
jal drawRect

jr $t7

drawX:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect
addi $a0, $t5, 1
li $a1, 2
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect

jr $t7

drawY:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 0
li $a3, 3
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 2
li $a3, 3
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 0
li $a3, 3
jal drawRect

jr $t7

drawZ:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 3
li $a1, 1
addi $a2, $t6, 1
li $a3, 1
jal drawRect
addi $a0, $t5, 1
li $a1, 2
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 1
addi $a2, $t6, 3
li $a3, 1
jal drawRect
addi $a0, $t5, 0
li $a1, 4
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawBracket:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 2
li $a1, 2
addi $a2, $t6, 0
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 1
li $a1, 1
addi $a2, $t6, 2
li $a3, 1
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect
addi $a0, $t5, 2
li $a1, 2
addi $a2, $t6, 4
li $a3, 1
jal drawRect

jr $t7

drawPipe:
addi $t5, $a0, 9  	# Set $t5 to X
addi $t6, $a2, 10 	# Set $t6 to Y
move $t7, $ra		# Set $t7 to return address

addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 0
li $a3, 2
jal drawRect
addi $a0, $t5, 2
li $a1, 1
addi $a2, $t6, 3
li $a3, 2
jal drawRect

jr $t7
