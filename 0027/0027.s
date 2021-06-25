.global main
.data
fmt:
	.string "%i\n"
.text

main:
	call getArguments
	call factorial
	call display
	ret

getArguments:
	mov 8(%rsi), %rdi
	call atoi@plt
	mov %rax, %rbx
	ret

# factorial outputs the factorial of EBX to the terminal.  Overflow IS
# a problem here.
factorial:
	mov $1, %eax
	factorialMainLoop:
		mul %ebx
		sub $1, %ebx
		cmp $1, %ebx
		jg factorialMainLoop
		ret

# display prints the integer-based content of EAX to the terminal.
display:
	mov %eax, %esi
	lea fmt(%rip), %rdi
	mov $0, %al
	call printf@plt
	ret
