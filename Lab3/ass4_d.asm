# i+j > m+n
li $s2,5 #j=?
li $s1,15 #i=?
add $s1,$s1,$s2 #i+j
li $s3,10 #m=?
li $s4,20 #n=?
add $s3,$s3,$s4 #m+n
start:
slt $t0,$s3,$s1 # m+n < i+j ? 
beq $t0,$zero,else # t0 = 0? if t0 = 0 then branch to else 
# => if i+j <= m+n then branch to else
addi $t1,$t1,1 # x = x+1
addi $t3,$zero,1 # z = 0+1 = 1
j endif # jump to endif
else: addi $t2,$t2,-1 # y= y-1
add $t3,$t3,$t3 # z=z*2
endif:
