
li $s0, 0x12345678

#Extract MSB of register s0
srl $t0, $s0, 24         #t0= 0x00000012

#Clear LSB of register s0
andi $t1,$s0,0xffffff00  #t1 = 0x12345600

#Set LSB of register s0 (bits 7 to 0 are set to 1)
ori $t2,$s0,0x000000ff   #t2 = 0x123456ff

#Clear register s0 (s0=0, must use logical instructions)
andi $t3,$s0,0x00000000  #t3 = 0x00000000

#Exchange MSB of register s0 with LSB
andi $s1,$s0,0x00ffff00  #s1 = 0x00345600
sll $t4,$s0,24	     #t4 = 0x00000078
add $s1,$s1,$t0          #s1 = 0x00345612
add $s1,$s1,$t4	     #s1 = 0x78345612
