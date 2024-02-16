; Alumno: Fidel Moises Apari Sanchez
; Codigo: 20212126
    global diag_asm
    section .text
diag_asm:
    ; Argumentos
    ; ----------
    ; rdi <- int * mat
    ; esi <- int N

    ; Variables a usar
    ; ----------------
    ; r15 <- mitad de las columnas o filas
    ; r8 <- contador en decremento: de 0 a N-1
    ; ebx <- Suma de los valores en diagonal
    ; ecx <- Suma de los valores en fila y columna central
    ; r14 <- Funcionara como offset para el puntero
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    xor rdx, rdx
    
    mov rax, rsi
    mov rcx, 2
    div rcx
    mov r15, rax

    xor r8, r8
    xor r12, r12
    xor r13, r13
    xor r14, r14
    _calc_loop:

        ; i*N + i
        mov r14, r13
        add r14, r8
        add ebx, [ rdi + 4*r14]

        ; i*N + N - i - 1
        mov r14, r13
        add r14, rsi
        sub r14, r8
        dec r14
        add ebx, [ rdi + 4*r14 ]

        ; i*N + med
        mov r14, r13
        add r14, r15
        add ecx, [ rdi + 4*r14 ]

        ; i*med + N
        mov r14, r12
        add r14, rsi
        add ecx, [ rdi + 4*r14 ]

        ; i*N
        add r13d, esi
        add r12d, r15d
        inc r8

        cmp r8d, esi
        jne _calc_loop

    _end:
        xor rax, rax
        cmp ecx, ebx
        jne _false
            inc eax
        _false:   
        ret