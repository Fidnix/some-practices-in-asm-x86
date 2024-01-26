section .data
    var1 db 54,23, 10,11

section .text
    global _start

_start:
    mov rax, 4
    mov rbx, 3

    
    _c1:
    mul rax

    _c2:
    
    mov rax, 60
    mov rdi, 0
    syscall