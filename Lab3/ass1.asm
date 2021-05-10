#Laboratory Exercise 3, Sample Code 1
#	if (i<=j)
#		x=x+1;
#		z=1;
#	else
#		y=y-1;
#
#		z=2*z;
.data 
	i: .word 5
	j: .word 6
	x: .word 2
	y: .word 3
	z: .word 1
.text 
lw $s1,i
lw $s2,j
la $t8,x
la $t9,y
la $t7,z
lw $t1,x
lw $t2,y
start:
slt $t0,$s2,$s1 # j < i ? / if s2 < s1 then t0 =1 , else t0 =0;
bne $t0,$zero,else # t0 = 0? if t0 != 0 then branch to else
#	=> if j>=i then branch to else
addi $t1,$t1,1 # x = x+1
addi $t3,$zero,1 # z = 0+1 = 1
sw $t1,0($t8)
sw $t3, 0($t7)

j endif # …
else: addi $t2,$t2,-1 # …
add $t3,$t3,$t3 # …
sw $t2,0($t9)
sw $t3,0($t7)
endif: