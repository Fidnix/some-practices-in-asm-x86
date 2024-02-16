section .data
    float1 dd 5.0, 4.0, 1.0, 3.0
    float2 dd 0.1, 1.3, 4.6, 8.9
    float3 dd 0.0, 0.0, 0.0, 0.0

    len dq 5 
section .text
    global _start

_start:
;rdi <- float *A
;rsi <- float *x
;rdx <- float *b
;rcx <- int N
;Reformular y comparar haciendo uso de la instrucción haddps
mov r8, rdi
mov r10, rcx
mov r13, rdx

xor r9,r9
xor r11, r11
xor r12, r12
xor r15, r15

for_i:
    mov r9, rsi
    mov rbx, rcx
    xorpd xmm3, xmm3
    for_j:
        imul r12,rcx;   r12 = r12*rcx
        shl r12,2
        movaps xmm0, [r8 + r12]
        movaps xmm1, [r9]
        mulps xmm0, xmm1

        movaps xmm2,xmm0
        shufps xmm2,xmm2, 01001110b
        addps xmm0, xmm2

        movaps xmm2,xmm0
        shufps xmm2,xmm2, 10110001b
        addps xmm0, xmm2
        addss xmm3, xmm0

        add r8, 16
        add r9, 16
        sub rbx, 4
        jnz for_j

    movss [r13], xmm3
    add r15, rcx
    add r13, 4
    dec r10
    jnz for_i
    
    mov rax, 60
    mov rdi, 0
    syscall