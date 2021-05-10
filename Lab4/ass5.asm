#Chuong trinh nhan so nguyen x voi so 2^n

li $s0,100 #x=?
li $t0,9	#n=?
li $s1,0 #i=0
loop:
	mul $s0,$s0,2 #x*2
	addi $s1,$s1,1 #i++
	bne $s1,$t0,loop #if i!=n, branch to loop
