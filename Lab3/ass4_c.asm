#if i+j<=0
start:
li $s1,-20 #j=?
addi $s1,$s1,10 #i=?
slt $t0,$zero,$s1 # i+j > 0 ? / if s1 > 0 then t0 =1 , else t0 =0;
bne $t0,$zero,else # t0 = 0? if t0 != 0 then branch to else 
# => if i+j > 0 then branch to else
addi $t1,$t1,1 # x = x+1
addi $t3,$zero,1 # z = 0+1 = 1
j endif # jump to endif
else: addi $t2,$t2,-1 # y= y-1
add $t3,$t3,$t3 # z=z*2
endif:
