    .global main
    .global reverse_print
    .text

reverse_print:
    pushq %rbp
    movq %rsp, %rbp
    subq	$32, %rsp
    movq	%rdi, -24(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, %rdi
    call	strlen
    subl	$1, %eax
    movl	%eax, -4(%rbp)
    jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar
	subl	$1, -4(%rbp)
.L2:
	cmpl	$0, -4(%rbp)
	jns	.L3
	nop
	nop
	leave
	ret

.LC0:
	.asciz "Hello World"
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$.LC0, %edi
	call	reverse_print
	movl	$0, %eax
	popq	%rbp
	ret
