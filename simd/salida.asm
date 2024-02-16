section .data
    smt dd 1.0, 2.0, 3.0, 4.0
    smt2 dd 0.0, 0.0, 0.0, 0.0

section .text
    global _start:
_start:
    movaps xmm0, [smt]
    movaps [smt2], xmm0

    ; xor r9, r9

    _end:

    mov rax, 60
    mov rdi, 0
    syscall
