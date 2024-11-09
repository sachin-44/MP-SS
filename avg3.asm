section .data
    msg1 db 10,13,"ENTER FIRST NUMBER:$"
    msg2 db 10,13,"ENTER SECOND NUMBER:$"
    msg3 db 10,13,"ENTER THE THIRD NUMBER:$"
    msg4 db 10,13,"THE AVERAGE IS:$"

section .bss
    num1 resb 1  ; Reserve 1 byte for the first number
    num2 resb 1  ; Reserve 1 byte for the second number
    num3 resb 1  ; Reserve 1 byte for the third number

section .text
    global _start

_start:
    mov ax, data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov [num1], al  ; Store first number in num1

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov [num2], al  ; Store second number in num2

    lea dx, msg3
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov [num3], al  ; Store third number in num3

    ; Add numbers
    mov al, [num1]
    add al, [num2]
    add al, [num3]

    ; Divide by 3 for average
    mov bl, 3
    div bl

    lea dx, msg4
    mov ah, 09h
    int 21h

    ; Output the result (average)
    mov dl, al
    add dl, '0'
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
