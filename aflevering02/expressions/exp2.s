#Exp2        
        .text
        .globl  example
example:
        pushq   %rbp
        movq    $5, %rsi
        movq    $1, %rax
        imulq   %rsi, %rax
        cqto
        movq    $10, %rdi
        idivq   %rdi
        movq    %rax, %rdi
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq