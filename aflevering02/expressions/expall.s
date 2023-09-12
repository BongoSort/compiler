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

        .text
        .globl  example
example:
        pushq   %rbp
        movq    $31, %rdi
        movq    $870, %rsi
        subq    %rsi, %rdi
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq

        .text
        .globl  example
example:
        pushq   %rbp
        movq    $10, %rcx
        movq    $49, %r9
        addq    %rcx, %r9
        movq    $6, %rax
        cqto
        idivq   %r9
        movq    %rax, %rbx
        addq    %rcx, %rbx
        movq    $70, %r8
        movq    $77, %r9
        imulq   %r9, %r8
        movq    $5, %r11
        movq    $12, %rax
        cqto
        movq    $9, %r10
        idivq   %r10
        addq    %r11, %r8
        subq    %rax, %r8
        imulq   %rbx, %r8
        movq    %r8, %rdi
        callq   print_int
        movq    $0, %rax
        popq    %rbp
        retq
        
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