section .data
    a dd 4
    b dd 3
    c dd 7

section .text
    global _start
_start:
    ; En Asm x86 la multiplicación se da con el valor que esté en el registro A. Adicional se le da un parámetro que será el segundo factor de multiplicación
    ; Además el valor de la multiplicación serán los registros: rdx:rax. Siendo rdx los valores más significativos del resultado; mientras que
    ; rax los valores menos significativos
    mov eax, [a]
    mov ebx, [b]

    mul ebx
    
    _cp:

    mov eax, [a]
    mov edx, [c]
    mul edx

    _cp2:

    mov rax, 60
    mov rdi, 0
    syscall

