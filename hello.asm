global _start

section .bss
buffer resb 100
input_length resb 1

section .data
message db 72, 101, 108, 108, 111, 0

prompt db "Enter any string: ", 0
prompt_len equ $ - prompt

output_prefix db "Your string: ", 0
output_prefix_len equ $ - output_prefix

calc_lable db "Мой калькулятор на NASM", 0
calc_lable_len equ $ - calc_lable

section .text
_start:
    ; Lable output
    mov rax, 1
    mov rdi, 1
    mov rsi, calc_lable
    mov rdx, calc_lable_len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, buffer

    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 100
    syscall

    mov [input_length], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, output_prefix
    mov rdx, output_prefix_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, [input_length]
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, message
    ; mov rdx, 5
    ; syscall
    ; jmp exit

; exit:
;     mov rax, 60
;     xor rdi, rdi
;     syscall