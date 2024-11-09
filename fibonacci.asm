section .data
    msg1 db 'Enter the number of Fibonacci terms: $'
    newline db 10, 13, '$'

section .bss
    limit resw 1

section .text
    global _start

_start:
    mov dx, msg1
    call printmsg
    call readnum
    mov [limit], ax
    call fiba
    mov eax, 1
    int 0x80

fiba:
    mov ax, 0
    mov bx, 1
    mov cx, 0

fiba_loop:
    call displayAX
    mov dx, newline
    call printmsg
    dec word [limit]
    mov cx, bx
    add bx, ax
    mov ax, cx
    cmp word [limit], 0
    jne fiba_loop
    ret

printmsg:
    mov eax, 4
    mov ebx, 1
    mov ecx, dx
    mov edx, 80
    int 0x80
    ret

readnum:
    mov bx, 0
    mov cx, 10

readnum_loop:
    mov eax, 3
    mov ebx, 0
    lea ecx, [number]
    mov edx, 1
    int 0x80
    cmp byte [number], '0'
    jb readnum_done
    cmp byte [number], '9'
    ja readnum_done
    sub byte [number], '0'
    mov ax, bx
    mul cx
    mov bx, ax
    add bx, byte [number]
    jmp readnum_loop

readnum_done:
    mov ax, bx
    ret

displayAX:
    mov cx, 0
    mov bx, 10

display_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jne display_loop

print_digits:
    pop dx
    add dl, '0'
    mov eax, 4
    mov ebx, 1
    lea ecx, [dx]
    mov edx, 1
    int 0x80
    loop print_digits
    ret
