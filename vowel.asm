section .data
    inp db "Enter the string: ", 0xa
    msg db "The number of vowels: ", 0xa
    vowel db 'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U'

section .bss
    databuf resb 100
    count resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, inp
    mov edx, 17
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, databuf
    mov edx, 100
    int 0x80

    mov byte [count], 0

    mov ecx, eax
    mov esi, databuf

check_char:
    mov al, [esi]
    inc esi
    cmp al, 0
    je print_count

    mov edi, vowel
    mov edx, 10

find_vowel:
    cmp al, [edi]
    je is_vowel
    inc edi
    dec edx
    jnz find_vowel

    jmp check_char

is_vowel:
    inc byte [count]
    jmp check_char

print_count:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 21
    int 0x80

    mov al, [count]
    add al, '0'
    mov [count], al
    mov eax, 4
    mov ebx, 1
    mov ecx, count
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
