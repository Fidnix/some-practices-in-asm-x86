section .text
    global _start
_start:
    mov eax, 0xAB00 ; Hexadecimales
    mov ebx, 0q237 ; Octales
    mov ecx, 0b101001 ; Binarios
    mov edx, 5712 ; Decimales
    _cp:

    mov rax, 60
    mov rdi, 0
    syscall