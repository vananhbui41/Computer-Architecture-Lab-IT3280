.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014
.text
main:   li $t1, IN_ADRESS_HEXA_KEYBOARD
	li $t2, OUT_ADRESS_HEXA_KEYBOARD
	li $t3, 0x1 	# check row 1 with key 0,1,2,3
	li $t4, 0x2 	# check row 2 with key 4,5,6,7
	li $t5, 0x4 	# check row 3 with key 8,9,a,b
	li $t6, 0x8 	# check row 4 with key c,d,e,f
polling: 
row1:
	sb $t3, 0($t1 ) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	bnez $a0, print 
row2:
	sb $t4, 0($t1 ) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	bnez $a0, print
row3:
	sb $t5, 0($t1 ) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	bnez $a0, print
row4:
	sb $t6, 0($t1 ) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	bnez $a0, print
print: 	li $v0, 34 	# print integer (hexa)
	syscall
sleep: 	li $a0, 100 	# sleep 100ms
	li $v0, 32
	syscall
back_to_polling: 
	j polling 	# continue polling
