section .data
    msg1 db 10,13,"ENTER THE NUMBER:$"
    msg2 db 10,13,"THE FACTORIAL IS:$"

section .bss
    number resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 18
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 1
    int 0x80

    sub byte [number], '0'
    mov al, [number]
    mov bl, al
    mov ax, 1

factorial_loop:
    mul bl
    dec bl
    cmp bl, 1
    jg factorial_loop

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 17
    int 0x80

    call print_number

    mov eax, 1
    xor ebx, ebx
    int 0x80

print_number:
    push ax
    mov cx, 0
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_digits:
    pop dx
    add dl, '0'
    mov ah, 0x02
    mov dl, dl
    int 0x80
    loop print_digits

    pop ax
    ret
