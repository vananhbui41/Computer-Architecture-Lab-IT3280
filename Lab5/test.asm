.data
	buffer: .space 50
.text
	li	$s6, 20
	li	$s7, 10
	
	la	$s0, buffer
	xor	$s1, $0, $0
	#xor	$s2, $0, $0
read_char:
	li	$v0, 12
	syscall
	
	add	$s1, $s0, $s3
	addi	$s3, $s3, 1
	beq	$s3, $s6, end_read_char
	beq	$v0, $s7, end_read_char
	sb	$v0, 0($s1)
	j	read_char
end_read_char:

print_char:
	li	$v0, 11
	lb	$a0,0($s1)
	syscall
	beq	$s1,$s0,exit
	addi $s1, $s1, -1
	j	print_char
exit:

