section .data
    msg db "Enter",0xa
    colon db ": "
    newline db 0xa
    
section .bss
    str1 resb 100
    count resb 1
    
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,6
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80
    
    mov byte[str1+eax-1],0
    
    mov esi,str1
    
    
    
loop1:
    mov al,[esi]
    ;xor ebx,ebx
    test al,al
    jz end
    
    mov edi,str1
    xor ecx,ecx
    
loop2:
    mov bl,[edi]
    test bl,bl
    jz print
    cmp al,bl
    jne nxt
    inc ecx
    ;inc edi
    ;jmp loop2
    
nxt:
    inc edi
    jmp loop2
    
print:
    mov eax,ecx
    add eax,'0'
    mov [count],eax
    
    
    mov eax,4
    mov ebx,1
    mov ecx,esi
    mov edx,1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,colon
    mov edx,2
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,count
    mov edx,1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,newline
    mov edx,1
    int 0x80
    
    inc esi
    jmp loop1
    
end:
    mov eax,1
    int 0x80
    
