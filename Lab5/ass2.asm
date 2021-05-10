#“The sum of (s0) and (s1) is (result)”.
.data 
message1: .asciiz "The sum of " 
message2: .asciiz " and "
message3: .asciiz " is "

.text 
	li $s0,10
	li $s1,50
	
#print message1:
	li $v0,4	
	la, $a0, message1
	syscall

#print s0:
	li $v0,1
	add $a0, $zero, $s0
	syscall

#print mess2:
	li $v0,4
	la $a0,message2
	syscall

#print s1:
	li $v0,1
	add $a0, $zero, $s1
	syscall

#print mess3:
	li $v0,4
	la $a0,message3
	syscall

#print result:
	li $v0,1
	add $a0, $s0, $s1
	syscall	


