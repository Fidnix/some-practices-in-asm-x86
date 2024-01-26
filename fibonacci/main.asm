section .data
    total dd 10
section .bss
    seq resb 10
    pointer resb 1

section .text
    global _start

_start:
    ; Datos iniciales del fibonacci
    mov rbx, 0
    mov r8d, 0
    mov [seq + 4*rbx], r8d
    
    inc rbx
    mov r8d, 1
    mov [seq + 4*rbx], r8d

    _loop:

        add r8d, [seq + 4*(rbx - 1)]
        inc rbx

        mov [seq + 4*rbx], r8d

        
        cmp rbx, 9
        jne _loop
    
    ; _suma:
    ;     mov r8b, [seq + rbx]
    ;     add r8b, 97

    ;     mov [seq + rbx], r8b
    ;     inc rbx

    ;     dec cl
    ;     cmp cl, 0
    ;     jne _suma

    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, seq
    ; mov rdi, 10
    ; syscall   
    ; Mostrar en pantalla

    ; mov cl, [total]
    ; dec cl
    ; mov rax, 1
    ; mov rdi, 1
    ; mov r8, 0
    ; _out:
    ;     ; mov rdx, 0
    ;     ; mov dl, [seq + rcx]
    ;     ; add dl, 97
    ;     ; mov rsi, [seq + rcx]
    ;     mov rsi, 97
    ;     mov rdx, 1
    ;     syscall

    ;     dec cl
    ;     cmp cl, 0
    ;     jne _out

    _smt:

    ; Exit
    mov rax, 60
    mov rdi, 0
    syscall