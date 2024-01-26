section .data
    a dd 2
    b dd 4
section .text
    global _start:
_start:
    mov eax, [a]
    mov ecx, [b]
    mul ecx

    final:
    mov rax, 60
    mov rdi, 0
    syscall