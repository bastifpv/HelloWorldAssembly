global _start

section .text

_start:
    MOV rax, 0x1
    MOV rdi, 0x1
    MOV rsi, msg
    MOV rdx, msglen
    SYSCALL

    MOV rax, 0x0
    MOV rdi, 0x0
    MOV rsi, dynvar
    MOV rdx, dynvarlen
    SYSCALL

    MOV rax, 0x1
    MOV rdi, 0x1
    MOV rsi, dynvar
    MOV rdx, dynvarlen
    SYSCALL

    MOV rax, 0x3C
    MOV rdi, 0x0
    SYSCALL

section .data
    msg: DB "Hello, World", 0xA
    msglen: EQU $ - msg
    dynvar: DB "Test"
    dynvarlen: EQU 0x20 