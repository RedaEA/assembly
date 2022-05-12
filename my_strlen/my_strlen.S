    .global main
    .global my_strlen
    .text

my_strlen:
    movq $0, %rax
.L1:
    movq %rdi, %rbx
    addq %rax, %rbx

    movb (%rbx), %cl
    testb %cl, %cl
    jne .L2
    ret

.L2:
    addq $1, %rax
    jmp .L1

.LC0:
    .asciz "ssdfalut"

main:
    movq $.LC0, %rdi
    call my_strlen
    movq $format, %rdi
    movq %rax, %rsi
    xor %rax, %rax
    call printf
    mov $0, %rax
    ret

format:
    .asciz "%ld\n"
