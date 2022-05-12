	.global main
	.global extract
	.text

extract:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	nop
	leave
	ret
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$7886754460862475369, %rax
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	pushq	%rax
	movl	$100, %r9d
	movl	$99, %r8d
	movl	$49, %ecx
	movl	$48, %edx
	movl	$45, %esi
	movl	$42, %edi
//	call	make_stuff
	addq	$8, %rsp
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	extract
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	ret

