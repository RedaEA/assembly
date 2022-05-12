    .global main
    .global my_add

    .text

my_add:
    ;pushq %rbp
    movl %edi, %edx
    movl %esi, %eax
    addl %edx, %eax
    ;popq %rbp
    ret

main:
    movl $42, %edi
    movl $50, %esi
    call my_add
    push %rax
    mov $format, %rdi
    mov %rax, %rsi
    xor %rax, %rax
    call printf
    pop %rax
    mov $0, %rax
    ret

format:
    .asciz "%ld\n"
