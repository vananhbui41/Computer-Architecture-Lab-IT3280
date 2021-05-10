# “The multiplication of X base 10 (or X’ base 16) and Y base 10 (or Y’
# base 16) is Z base 10 (or Z’ base 16).”
.data
mes1: .asciiz "The multiplication of "
mes2: .asciiz " base 10 (or "
mes3: .asciiz " base 16) and "
mes4: .asciiz " base 16) is "
mes5: .asciiz " base 16)."
.text
li $s0,0x7fffffff #X=?
li $s1,0x7fffffff #Y=?
mul $t0,$s0,$s1

li $v0,4
la $a0,mes1
syscall

#print X
li $v0,1
add $a0, $zero, $s0
syscall

li $v0,4
la $a0,mes2
syscall

#print X'
li $v0,34
add $a0,$zero,$s0
syscall

li $v0,4
la $a0,mes3
syscall

#print Y
li $v0,1
add $a0, $zero, $s1
syscall

li $v0,4
la $a0,mes2
syscall

#print Y'
li $v0,34
add $a0,$zero,$s1
syscall

li $v0,4
la $a0,mes4
syscall

#print Z
li $v0,1
add $a0, $zero, $t0
syscall

li $v0,4
la $a0,mes2
syscall

#print Z'
li $v0,34
add $a0,$zero,$t0
syscall

li $v0,4
la $a0,mes5
syscall