section .data
    num dd 123.75
    ten dd 10.0
    zero dd 0.0

section .bss
    output resb 15

section .text
    global _start
_start:
    movss xmm0, [num]
    cvttss2si eax, xmm0

    cvtsi2ss xmm1, eax
    subss xmm0, xmm1
    
    xor rcx, rcx
    mov r8d, 10
    _int_2_str:
        div r8d
        add dl, 48
        mov [output + rcx], dl
        inc rcx

        xor rdx, rdx
        cmp eax, 9
        jg _int_2_str

    add al, 48
    mov [output + rcx], al

    xor rbx, rbx
    xor rdx, rdx
    mov r8, 0
    mov r9, rcx
    _str_al_reves:
        mov bl, [output + r8]
        mov dl, [output + r9]

        mov [output + r8], dl
        mov [output + r9], bl

        inc r8
        dec r9

        cmp r9, r8
        jg _str_al_reves

    inc rcx
    mov bl, 46
    mov [output + rcx], bl
    inc rcx

    xorps xmm2, xmm2
    _dec_str:
        mulss xmm0, [ten]
        cvttss2si eax, xmm0
        cvtsi2ss xmm2, eax
        add eax, 48
        mov [output + rcx], al
        inc rcx

        subss xmm0, xmm2
        ucomiss xmm0, [zero]
        jne _dec_str

        cmp rcx, 15
        jl _dec_str
    
    _cp:

    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, 15
    syscall


    mov rax, 60
    mov rdi, 0
    syscall