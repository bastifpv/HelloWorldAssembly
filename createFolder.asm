global _start

section .text

_start:
    MOV rax, 0x01
    MOV rdi, 0x01
    MOV rsi, msg
    MOV rdx, msglen
    SYSCALL

    MOV rax, 0x00
    MOV rdi, 0x0
    MOV rsi, dynvar
    MOV rdx, dynvarlen
    SYSCALL

    MOV rax, 0x53 
    MOV rdi, dynvar
    MOV rsi, 0o777 
    XOR rdx, rdx 
    SYSCALL

    MOV rdi, rax
    MOV rax, 3
    SYSCALL

    MOV rax, 0x3C
    MOV rdi, 0x0
    SYSCALL

section .data
    msg: DB "Input Folder Name:", 0xA
    msglen: EQU $ - msg
    dynvar: DB ""
    dynvarlen: EQU 0x20 