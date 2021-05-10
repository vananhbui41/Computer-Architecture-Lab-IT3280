li $s1,50000
 sra $s2,$s1,0x00000010
 abs $s0,$s1
 
#s0 <= |$s1|
move $s0, $s1
not $s1,$s1
 ble $s1,$s2,L
li $s5,6
li $s7,5
L: li $s4, 5
