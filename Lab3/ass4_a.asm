#if i<j
li $s2,5 #j=?
li $s1,5 #i=?
start:
slt $t0,$s1,$s2 # i < j ? / if s1 < s2 then t0 =1 , else t0 =0;
beq $t0,$zero,else # t0 = 0? if t0 = 0 then branch to else 
# => if j <= i then branch to else
addi $t1,$t1,1 # x = x+1
addi $t3,$zero,1 # z = 0+1 = 1
j endif # jump to endif
else: addi $t2,$t2,-1 # y= y-1
add $t3,$t3,$t3 # z=z*2
endif:
