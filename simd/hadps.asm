section .data
    float1 dd 1.0, 2.0, 3.0, 4.0
    float2 dd 10.0, 11.0, 12.0, 14.0

section .text
    global _start:
_start:
    movaps xmm0, [float1]
    movaps xmm1, [float2]

    haddps xmm0, xmm1

    _end:

    mov rax, 60
    mov rdi, 0
    syscall