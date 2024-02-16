section .data
    float1 dd 1.0, 2.0, 3.0, 4.0
    float2 dd 5.0, 6.0, 7.0, 8.0

section .text
    global _start
_start:
    movaps xmm1, [float1]
    movaps xmm2, [float2]

    shufps xmm1, xmm2, 11001100b 

    _end:

    mov rax, 60
    mov rdi, 0
    syscall