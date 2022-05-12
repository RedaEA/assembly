    .global main
    .global my_strcpy
    .text

my_strcpy:
    movq %rdi, %rax

L1:
    mov (%rsi), %rbx
    mov %rbx, (%rdi)
    cmpb $0, (%rsi)
    je L2
    INC %rsi
    INC %rdi
    jmp L1

L2:
    ret
