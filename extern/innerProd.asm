    global innerProd
    section .text
innerProd:
    ; rdi <- float * a
    ; rsi <- float * b
    ; rdx <- int n
    xorpd xmm0, xmm0
    xorpd xmm1, xmm1
    xorpd xmm2, xmm2

    cmp rdx, 0
    je done
next:
    movss xmm2, [rdi]
    movss xmm1, [rsi]

    mulss xmm2, xmm1
    addss xmm0, xmm2

    add rdi, 4
    add rsi, 4

    sub rdx, 1
    jnz next
done:
    ret