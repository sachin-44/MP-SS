section .data
    msg1 db "enter",0xa
    eq db "equal",0xa
    neq db"not equal",0xa
    
section .bss
    str1 resb 100
    str2 resb 100

section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,6
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80
    mov byte[str1+eax-1],0
    
    mov eax,3
    mov ebx,0
    mov ecx,str2
    mov edx,100
    int 0x80
    mov byte[str2+eax-1],0
    
    mov esi,str1
    mov edi,str2
    
loop1:
    mov al,[esi]
    mov bl,[edi]
    test al,al
    jz done
    cmp al,bl
    jnz n_eq
    inc esi
    inc edi
    jmp loop1
    
n_eq:
    mov eax,4
    mov ebx,1
    mov ecx,neq
    mov edx,10
    int 0x80
    jmp cmplt
    
done:
    mov eax,4
    mov ebx,1
    mov ecx,eq
    mov edx,6
    int 0x80
    jmp cmplt
    
cmplt:
    mov eax,1
    int 0x80
