section .data
    msg1 db "Enter a number (1-255): ", 0xa
    isprime db "The number is Prime", 0xa
    notprime db "The number is not Prime", 0xa
    newline db 0xa

section .bss
    number resb 2

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 23
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 2
    int 0x80

    movzx bx, byte [number]
    sub bl, '0'
    movzx ax, byte [number + 1]
    sub al, '0'
    imul bx, 10
    add bx, ax

    cmp bx, 1
    je not_prime
    cmp bx, 2
    je prime

    mov cx, bx

    mov ax, cx
    mov dx, 0
    mov bx, 2
    div bx
    cmp dx, 0
    je not_prime

    mov ax, cx
    mov dx, 0
    mov bx, 3
    div bx
    cmp dx, 0
    je not_prime

    mov ax, cx
    mov dx, 0
    mov bx, 5
    div bx
    cmp dx, 0
    je not_prime

    mov ax, cx
    mov dx, 0
    mov bx, 7
    div bx
    cmp dx, 0
    je not_prime

prime:
    mov eax, 4
    mov ebx, 1
    mov ecx, isprime
    mov edx, 18
    int 0x80
    jmp exit

not_prime:
    mov eax, 4
    mov ebx, 1
    mov ecx, notprime
    mov edx, 23
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
