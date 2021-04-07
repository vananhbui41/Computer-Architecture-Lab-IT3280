#insertion_sort
.data 
	A: .word -5,1,3,5,7,7,-10,11,1,-5,6,7,8,10,11,60,58,7,8,-100,-3,-9,8,31,41
	Aend: .word
.text
main: 
	la $a0,A
	la $a1,Aend
	addi $t0,$a0,4
	j insertion_sort
after_sort: li $v0, 10 #exit
	syscall
end_main:
	
insertion_sort:
	add $v0,$t0,0
loop:	lw $s0,0($v0)
	lw $s1,-4($v0)
	slt $s2,$s0,$s1
	beq $s2,$zero,skip_swap
	sw $s0,-4($v0)
	sw $s1,($v0)
	subi $v0,$v0,4
	beq $v0,$a0,skip_swap
	j loop
skip_swap:
	addi $t0,$t0,4
	beq $t0,$a1,end_sort
	j insertion_sort
end_sort: j after_sort
	
	
	