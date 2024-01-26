section .data
    question db "Cual es tu nombre?",10
    lenq equ $ - question
    greet db "Hola, "
    leng equ $ - greet

section .bss
    name resb 16

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, lenq

    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16

    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, greet
    mov rdx, leng

    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall

    mov rax, 60
    mov rdi, 0
    syscall