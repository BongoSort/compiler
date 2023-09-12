        .text
        .globl  example
example:
        pushq   %rbp
        movq    $26, %rsi
        movq    $58, %rdx
        imulq   %rsi, %rdx
        movq    $20, %rdi
        addq    %rdx, %rdi
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq