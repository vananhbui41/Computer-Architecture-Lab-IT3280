.data
MesOfMax: .asciiz ",largest value is "
MesOfMin: .asciiz ",smallest value is "
MesMaxIndex: .asciiz "The largest element is stored in $s"
MesMinIndex: .asciiz "\nThe smallest element is stored in $s"
.text
main: 	li $s0, -1
	li $s1, 5
	li $s2, 10
	li $s3, 9
	li $s4, 20
	li $s5, -9
	li $s6, 1
	li $s7, -12
	jal find
	nop
	
	li $v0, 4
	la $a0, MesMaxIndex 
	syscall
	li $v0,1
	add $a0,$t8,$zero
	syscall
	
	li $v0,4
	la $a0, MesOfMax 
	syscall
	li $v0,1
	add $a0,$t0,$zero
	syscall
	
	li $v0,4
	la $a0, MesMinIndex 
	syscall
	li $v0,1
	add $a0,$t9,$zero
	syscall
	
	li $v0,4
	la $a0, MesOfMin 
	syscall
	li $v0,1
	add $a0,$t1,$zero
	syscall
	
	li $v0, 10 
	syscall
endmain:
swapMax:	add $t0,$t3,$zero 
	add $t8,$t2,$zero 
	jr $ra
swapMin:	add $t1,$t3,$zero 
	add $t9,$t2,$zero 
	jr $ra
find: 	add $fp,$sp,$zero 
	addi $sp,$sp, -32 
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	sw $s4, 12($sp)
	sw $s5, 16($sp)
	sw $s6, 20($sp)
	sw $s7, 24($sp)
	sw $ra, 28($sp) 
	add $t0,$s0,$zero 
	add $t1,$s0,$zero 
	li $t8, 0 
	li $t9, 0 
	li $t2, 0 
max_min:	addi $sp,$sp,4
	lw $t3,-4($sp)
	sub $t4, $sp, $fp 
	beq $t4,$zero, done 
	addi $t2,$t2,1 
	sub $t4,$t0,$t3 
	bltzal $t4, swapMax 
	sub $t4,$t3,$t1
	bltzal $t4, swapMin 
	j max_min
done: 	lw $ra, -4($sp) 
	jr $ra 