section .data
    mi_str db "193724", 10
    len1 equ $ - mi_str
section .bss
    num resd 1

section .text
    global _start
_start:
    xor rbx, rbx
    xor rcx, rcx
    mov r8d, 10
    _str_2_int:
        mov bl, [mi_str + rcx]
        cmp bl, 10
        je _end_str_2_int

        sub ebx, 48
        add eax, ebx
        mul r8d
        inc rcx
        jmp _str_2_int
    _end_str_2_int:

    div r8d
    mov [num], eax
    _cp:

    mov rax, 60
    mov rdi, 0
    syscall