#Exp3
        .text
        .globl  example
example:
        pushq   %rbp
        movq    $10, %r8
        movq    $49, %r9
        addq    %r9, %r8
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq