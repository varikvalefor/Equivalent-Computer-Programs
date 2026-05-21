# ni'o na'e prane le ka ce'u mapti
# kei ni'i zo'e joi le su'u la'oi .RARS.
# smimlu fi la .varik. fe le ka ce'u
# tolmapti tu'a zo'e ja la'oi .getArgs.

.text
top:
	li s0, 1
	li a7, 5
	ecall
	mv s1, a0
lupe:
	mv a0, s0
	li a7, 1
	ecall
	addi s0, s0, 1
	ble s0, s1, lupe
fanmo:
	li a0, '\n'
	li a7, 11
	ecall
	
	li a7, 10
	ecall
