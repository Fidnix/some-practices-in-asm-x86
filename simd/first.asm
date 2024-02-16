section .data
    floats dd 2.0, 3.0, 4.0, 5.0, 10.0, 11.0, 12.0, 13.0

section .text
    global _start

_start:
    movaps xmm0, [floats]
    movaps xmm1, [floats + 16] ; 16 es porque se desplaza 4 floats y cada float tiene 4 bytes (4*4 = 16)
    _end:

    mov rax, 60
    mov rdi, 0
    syscall
