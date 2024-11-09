section .data
    msg1 db 0AH,0DH,"ENTER FIRST NUMBER:$"
    msg2 db 0AH,0DH,"ENTER SECOND NUMBER:$"
    msg3 db 0AH,0DH,"THE AVERAGE IS:$"

section .bss
    num1 resb 1
    num2 resb 1
    result resb 1

section .text
    global _start

_start:
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [num1], al

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [num2], al

    mov al, [num1]
    add al, [num2]
    mov bl, 2
    div bl
    mov [result], al

    mov ah, 09h
    lea dx, msg3
    int 21h

    mov al, [result]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
