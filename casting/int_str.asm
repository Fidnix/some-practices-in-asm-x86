section .data
    num dd 3481297
section .bss
    output resb 10
section .text
    global _start

_start:
    mov eax, [num]
    mov r8d, 10
    mov rcx, 9
    _int_2_str:
        div r8d
        add dl, 48
        mov [output + rcx], dl
        dec rcx

        xor rdx, rdx
        cmp eax, 9
        jg _int_2_str

    add al, 48
    mov [output + rcx], al

    _cp:

    mov rax, 60
    mov rdi, 0
    syscall