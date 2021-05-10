.eqv KEY_CODE 0xFFFF0004 # ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ?
# Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C # ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 # =1 if the display is already to do
# Auto clear after sw
.eqv e 0x65
.eqv x 0x78
.eqv i 0x69
.eqv t 0x74
.text
li $k0, KEY_CODE
li $k1, KEY_READY
li $s0, DISPLAY_CODE
li $s1, DISPLAY_READY
loop: nop
WaitForKey: lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
	nop
	beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
	nop
#-----------------------------------------------------
ReadKey: lw $t0, 0($k0) # $t0 = [$k0] = KEY_CODE
	j check_e
	nop
#-----------------------------------------------------
WaitForDis: lw $t2, 0($s1) # $t2 = [$s1] = DISPLAY_READY
	nop
	beq $t2, $zero, WaitForDis # if $t2 == 0 then Polling
	nop
#-----------------------------------------------------
Encrypt: 	addi $t0, $t0, 1 # change input key
#-----------------------------------------------------
ShowKey: 	sw $t0, 0($s0) # show key
	nop
#-----------------------------------------------------
	j loop
	nop
check_e: 	beq $t3,e,check_x
	bne $t0,e,WaitForDis
	add $t3,$t0,$zero
	j  WaitForDis
check_x:	beq $t4,x,check_i
	bne $t0,x,WaitForDis
	add $t4,$t0,$zero
	j  WaitForDis
check_i:	beq $t5,i,check_t
	bne $t0,i,WaitForDis
	add $t5,$t0,$zero
	j  WaitForDis
check_t:	beq $t0,t,exit
	j reset
reset: 	li $t3,0
	li $t4,0
	li $t5,0
	j WaitForDis
exit: 	li $v0,10
	syscall
	
	