.data 
intro: .asciiz "Chuong trinh tinh dien tich ..."
nhapb: .asciiz "Nhap b: "
nhapn: .asciiz "Nhap n:"
ketqua: .asciiz "Ket qua: S = "
.text 
main:	
	li $v0,55
	la $a0,intro
	li $a1,1
	syscall

	li $v0,52
	la $a0, nhapb
	syscall
	mov.s $f1,$f0 
	
	li $v0,51
	la $a0,nhapn
	syscall
	move $s0,$a0
	
	
	jal hinhthang
	
endmain: 
	li $v0,57
	la $a0,ketqua
	add.s $f12,$f12,$f0
	syscall
	
	li $v0,10
	syscall  

#ham tinh dien tich theo phuong phap hinh thang
#  $s0 / $f2<- n, h-> $f2, x-> $f3; 
# f(0) -> $f4; f(b) -> $f5
# Ket qua tra ve S -> $f0
hinhthang:
	addi $sp,$sp,-32
	sw $ra,0($sp)
	sw $s0,4($sp)
	swc1 $f1,8($sp)
	swc1 $f2,12($sp)
	swc1 $f3,16($sp)
	swc1 $f4,20($sp)	
	swc1 $f5,24($sp)
	swc1 $f6,28($sp)
	sw $t0,32($sp)
	sw $t1,36($sp)	
	mtc1 $s0,$f2		#move n to FPU
	cvt.s.w $f2,$f2		#convert from word to float
	div.s $f2,$f1,$f2	#h = b/n	
#tính S = (f(0)+f(b))/2
	jal tinhf		#f(b) ~ x=b
	mov.s $f4,$f1		
	sub.s $f1,$f1,$f1	#x=0
	jal tinhf		#f(0)
	mov.s $f5,$f1
	
	add.s $f0,$f4,$f5	#S=f(0)+f(b)
	addi $t0,$0,1
	mtc1 $t0,$f6
	cvt.s.w $f6,$f6
	add.s $f6,$f6,$f6
	div.s $f0,$f0,$f6	#S=S/2
	
	addi $t0,$0,1		#i=1
loop:	slt $t1,$t0,$s0		#if i>=n
	beq $t1,$0,done		#then branch to done
	mtc1 $t0,$f3		#move i to FTU
	cvt.s.w $f3,$f3		#convert i to float
	mul.s $f3,$f3,$f2	#x = i*h
	mov.s $f1,$f3		#x=x
	jal tinhf		#tinh f(x)
	add.s $f0,$f0,$f1	#S = S+f(x)
	addi $t0,$t0,1		#i=i+1
	j loop
	
done:	
	mul.s $f0,$f0,$f2	#S = h*S
	
	lw $s0,4($sp)
	lwc1 $f1,8($sp)
	lwc1 $f2,12($sp)
	lwc1 $f3,16($sp)
	lwc1 $f4,20($sp)	
	lwc1 $f5,24($sp)
	lwc1 $f6,28($sp)
	lw $t0,32($sp)
	lw $t1,36($sp)
	lw $ra,0($sp)
	addi $sp,$sp,32
	jr $ra

#tính hàm f(x)=4/(x^2+1) : x->$f1; ket qua tra ve $f1
tinhf: 	
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	swc1 $f2,8($sp)
	
	mul.s $f1,$f1,$f1	#x=x*x
	addi $s0,$0,1		
	mtc1 $s0,$f2		#move 1 to FPU
	cvt.s.w $f2,$f2		#convert 1 to float
	add.s $f1,$f1,$f2
	add.s $f2,$f2,$f2	#2
	mul.s  $f2,$f2,$f2	#4
	div.s $f1,$f2,$f1	#x=4/x
	
	lwc1 $f2,8($sp)
	lw $s0,4($sp)
	lw $ra,0($sp)
	addi $sp, $sp,12
	jr $ra
	
	
	
	
