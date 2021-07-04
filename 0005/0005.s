.global main

.data
fmt_digit:
	.asciz "%i"
fmt_newl:
	.asciz "\n"

.text
main:
	call getArguments
	call incrementAndPrint
	mov $0, %rax
	ret

getArguments:
	mov 8(%rsi), %rdi
	call atoi@plt
	ret

incrementAndPrint:
	movq %rax, %r13
	mov $1, %r12
	outputAndIncrementOrExit:
		mov %r12, %rsi
		lea fmt_digit(%rip), %rdi
		mov $0, %al
		call printf@plt

		add $1, %r12
		cmp %r12, %r13
		jge outputAndIncrementOrExit

		lea fmt_newl(%rip), %rdi
		mov $0, %al
		call printf@plt
		ret
