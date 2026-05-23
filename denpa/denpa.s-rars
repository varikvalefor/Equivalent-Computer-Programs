.data
oNotci:	.asciz	"ni'o banzuka le ka ce'u barda kei le ka ce'u tolmapti tu'a lo me zo valsi namcu\n"

.text
top:
	li	s0,	0
l:
	mv	s1,	s0
	mv	a0,	s0
	li	a7,	1
	jal	denpa
	ecall
	li	a0,	'\n'
	li	a7,	11
	ecall

	addi	s0,	s0,	1
	ble	s1,	s0,	l
	
	li	a7,	4
	la	a0,	oNotci
	ecall
	li	a7,	10
	ecall

denpa:
	li	t0,	-1
denpa_l:
	addi	t0,	t0,	1
	blt	t0,	a0,	denpa_l
	
	ret
