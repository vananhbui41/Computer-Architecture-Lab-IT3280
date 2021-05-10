#Laboratory Exercise 4
.text
li $s1,0x7fffffff
li $s2,0x7fffffff
start:
	li $t0,0 # No overflow is set as default status
	addu $s3,$s1,$s2 # s3 = s1 + s2
	xor $t1,$s1,$s2 # Check if $s1 and $s2 have the same sign?
	bltz $t1,EXIT # If not, exit
	xor $t2,$s3,$s1 # Check if ($s1 + $s2) and $s1 have the same sign?
	bgez $t2,EXIT #If not, overflow
OVERFLOW:
	li $t0,1 # The result overflows
EXIT:
