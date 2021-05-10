.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
	li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
	#(0,2)=> 8
	li $t0, RED
	sw $t0, 8($k0)
	nop
	#(0,4)=>16
	li $t0, RED
	sw $t0, 16($k0)
	nop
	#1,1 =>36
	li $t0, RED
	sw $t0, 36($k0)
	nop
	li $t0, RED
	sw $t0, 40($k0)
	nop
	#1,3 => 44
	li $t0, RED
	sw $t0, 44($k0)
	nop
	li $t0, RED
	sw $t0, 48($k0)
	nop
	#1,5 =>52
	li $t0, RED
	sw $t0, 52($k0)
	nop
	
	#2,0 => 64
	li $t0, RED
	sw $t0, 64($k0)
	nop
	li $t0, RED
	sw $t0, 68($k0)
	nop
	li $t0, RED
	sw $t0, 72($k0)
	nop
	li $t0, RED
	sw $t0, 76($k0)
	nop
	li $t0, RED
	sw $t0, 80($k0)
	nop
	li $t0, RED
	sw $t0, 84($k0)
	nop
	#2,6 => 88
	li $t0, RED
	sw $t0, 88($k0)
	nop
	#3,0=> 96
	li $t0, RED
	sw $t0, 96($k0)
	nop
	li $t0, RED
	sw $t0, 100($k0)
	nop
	li $t0, RED
	sw $t0, 104($k0)
	nop
	li $t0, RED
	sw $t0, 108($k0)
	nop
	li $t0, RED
	sw $t0, 112($k0)
	nop
	li $t0, RED
	sw $t0, 116($k0)
	nop
	#3,6 => 120
	li $t0, RED
	sw $t0, 120($k0)
	nop
	#4,1=> 132
	li $t0, RED
	sw $t0, 132($k0)
	nop
	li $t0, RED
	sw $t0, 136($k0)
	nop
	li $t0, RED
	sw $t0, 140($k0)
	nop
	li $t0, RED
	sw $t0, 144($k0)
	nop
	#4,5 => 148
	li $t0, RED
	sw $t0, 148($k0)
	nop
	#5,2 => 168
	li $t0, RED
	sw $t0, 168($k0)
	nop
	li $t0, RED
	sw $t0, 172($k0)
	nop
	#5,4 => 176
	li $t0, RED
	sw $t0, 176($k0)
	nop
	#6,3 => 204
	li $t0, RED
	sw $t0, 204($k0)
	nop