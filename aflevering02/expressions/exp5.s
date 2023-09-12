#Exp5
         .text
        .globl  example
example:
        pushq   %rbp
        movq    $34, %rax
        cqto
        movq    $72, %rbx
        idivq   %rbx
        movq    %rax, %rcx
        movq    $17, %rax
        cqto
        movq    $46, %rbx
        idivq   %rbx
        subq    %rax, %rcx
        movq    %rcx, %rdi
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq