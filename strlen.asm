section .data
    prompt db "Enter a string:", 0xa
    result_msg db "String length is: ", 0xa
    newline db 0xa

section .bss
    str resb 100
    length resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, str
    mov edx, 100
    int 0x80

    mov ecx, eax
    dec ecx
    mov [length], cl

    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    mov al, [length]
    add al, '0'

    mov eax, 4
    mov ebx, 1
    mov ecx, length
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
