.data
A: .word 5,-1,9,-10,3,10,5
max: .word
.text
li $s3,7 #n=?
la $s2, A 
loop:	
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	add $t1,$t1,$s2 #t1 store the address of A[i]
	lw $t0,0($t1) #load value of A[i] in $t0
	slt $s0,$t0,$zero #if A[i]<0
	bne $s0,$zero,change #if s0 !=0,goto change
	j compare
change: 	sub $t0,$zero,$t0
compare:	slt $s0,$s4,$t0 #if s4 < t0
	beq $s0,$zero,endif #if s4 >= t0, goto endif
	add $s4,$zero,$t0
endif:
	add $s1,$s1,1 #i=i+step
	bne $s1,$s3,loop #if i != n, goto loop
sw $s4, max
