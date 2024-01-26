section .text
    global _start

_start:
    mov eax, 5
    cvtsi2ss xmm0, eax

    _cp:

    addss xmm0, xmm0

    _cp2:


    mov rax, 60
    mov rdi, 0
    syscall