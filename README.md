# Compiler Handin

Backup file, commits are missing.

eval.ml and exp.ml is authored by Oliver Thomas, Carl-Emil Andersen and Rune Schuster

## Description

This compiler handin-project involves implementing an arithmetic expression evaluator in OCaml, along with generating corresponding assembly code. 

The project consists of two main parts:

- Expression Evaluation: The first part defines types for binary operations and arithmetic expressions, such as integers and binary operations (addition, subtraction, multiplication, division). 
It also includes a recursive evaluation function to compute the result of these expressions, with error handling for division by zero.

- Assembly Code Generation: The second part translates arithmetic expressions into X86 assembly code. Each expression is represented by a sequence of assembly instructions that perform the necessary arithmetic operations, and the results are printed using the C function.

The project demonstrates fundamental concepts of compilers, including abstract syntax trees, expression evaluation, and code generation.
