section .data
    num dd 12.7
    unit dd 1.0

section .bss
    output db 15

section .text
    global _start
_start:
    xor rcx, rcx

    movss xmm0, [num]
    cvtss2si eax, xmm0
    cvtsi2ss xmm1, eax

    ucomiss xmm0, xmm1
    jae _next_step

    sub eax, 1
    subss xmm1, [unit]

    _next_step:

    ; --- continuara
    
    _cp:

    mov rax, 60
    mov rdi, 0
    syscall