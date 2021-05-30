.data 
intro: .asciiz "Chuong trinh tinh dien tich!"
nhapb: .asciiz "Nhap duong gioi han x = b: "
checkb: .asciiz "Dieu kien: 2<=b<=4, b%2=0. Moi nhap lai!"
infob: .asciiz "Ban da nhap b = "
nhapn: .asciiz "Nhap so lan chia n: "
checkn: .asciiz "Dieu kien: 10<=n<=20. Moi nhap lai!"
infon: .asciiz "Ban da nhap n = "
ketqua: .asciiz "Dien tich cua hinh can tinh la S = "

.text 
main:	
	li $v0,55
	la $a0,intro
	li $a1,1
	syscall

	li $v0,51
	la $a0, nhapb
	syscall
	move $s0,$a0
	jal check_b
	mtc1 $s0,$f1		#move b to FPU
	cvt.s.w $f1,$f1		#convert from word to float
					
	li $v0,51
	la $a0,nhapn
	syscall
	move $s0,$a0
	jal check_n
	mtc1 $s0,$f2		#move n to FPU
	cvt.s.w $f2,$f2		#convert from word to float
	
	jal hinhthang
	
endmain: 
	li $v0,57
	la $a0,ketqua
	add.s $f12,$f12,$f0
	syscall
	
	li $v0,10
	syscall  
	
##########################################################
#Ham tinh dien tich theo phuong phap hinh thang
#$s0 / $f2 <- n, h-> $f2, x -> $f3; 
#f(0) -> $f4; f(b) -> $f5
#Ket qua tra ve S -> $f0
##########################################################
hinhthang:
	addi $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)		
	swc1 $f1,8($sp) 	
	swc1 $f2,12($sp)
	div.s $f2,$f1,$f2	#chieu cao hinh thang: h = b/n	
	
#tính (f(0)+f(b))/2
	jal tinhf		#f(b) ~ x=b
	mov.s $f4,$f1		
	sub.s $f1,$f1,$f1	#x=0
	jal tinhf		#f(0)
	mov.s $f5,$f1
	
	add.s $f0,$f4,$f5	#S=f(0)+f(b)
	addi $t0,$zero,1
	mtc1 $t0,$f6
	cvt.s.w $f6,$f6
	add.s $f6,$f6,$f6
	div.s $f0,$f0,$f6	#S=S/2
	
	addi $t0,$zero,1	#index i=1
loop:	slt $t1,$t0,$s0		#if i>=n
	beq $t1,$zero,done	#then branch to done
	mtc1 $t0,$f3		#move i to FTU
	cvt.s.w $f3,$f3		#convert i to float
	mul.s $f3,$f3,$f2	#i*h
	mov.s $f1,$f3		#x=i*h
	jal tinhf		#tinh f(x)
	add.s $f0,$f0,$f1	#S = S+f(x)
	addi $t0,$t0,1		#i=i+1
	j loop
	
done:	
	mul.s $f0,$f0,$f2	#S = h*S
	
	lw $s0,4($sp)
	lwc1 $f1,8($sp)
	lwc1 $f2,12($sp)
	lw $ra,0($sp)
	addi $sp,$sp,16
	jr $ra

##########################################################
#tính hàm f(x)=4/(x^2+1) : x->$f1; ket qua tra ve $f1
##########################################################
tinhf: 	
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	swc1 $f2,8($sp)
	
	mul.s $f1,$f1,$f1	#x=x*x
	addi $s0,$zero,1		
	mtc1 $s0,$f2		#move 1 to FPU
	cvt.s.w $f2,$f2		#convert 1 to float
	add.s $f1,$f1,$f2	#x^2+1
	add.s $f2,$f2,$f2	#2
	mul.s  $f2,$f2,$f2	#4
	div.s $f1,$f2,$f1	#f(x)=4/(x^2+1)
	
	lwc1 $f2,8($sp)
	lw $s0,4($sp)
	lw $ra,0($sp)
	addi $sp, $sp,12
	jr $ra

##########################################################
#Kiem tra dieu kien cua b: 
#2 <= b <= 4, b mod 2 = 0
##########################################################
check_b:

#kiem tra b >= 2?
check_2:
	slti $t1,$s0,2
	beqz $t1,check_4
	j nhap_lai_b

#kiem tra b <= 4?
check_4:
	sgt $t1,$s0,4
	beqz $t1,check_mod2
	j nhap_lai_b

#kiem tra b%2 = 0?	
check_mod2:
	addi $t1,$zero,2
	div $s0,$t1
	mfhi $t1
	beqz $t1,exit_check_b

nhap_lai_b:
	li $v0,51
	la $a0,checkb
	syscall
	move $s0,$a0
	j check_b
		
exit_check_b:
 	li $v0,56 
 	la $a0,infob
	add $a1,$s0,$zero
 	syscall
	jr $ra
	
##########################################################
#Kiem tra dieu kien cua n:
#10<= n <= 20 
##########################################################
check_n:

#kiem tra n >= 10?
check_10:
	slti $t1,$s0,10
	beqz $t1,check_20
	j nhap_lai_n

#kiem tra b <= 20?
check_20:
	sgt $t1,$s0,20
	beqz $t1,exit_check_n

nhap_lai_n:
	li $v0,51
	la $a0,checkn
	syscall
	move $s0,$a0
	j check_n

exit_check_n:
 	li $v0,56 
 	la $a0,infon
	add $a1,$s0,$zero
 	syscall
	jr $ra
