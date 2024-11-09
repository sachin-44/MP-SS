section .data
    msg1 db "enter string :"
    msg2 db "enter substring :"
    msgS db "SUCCESSFUL",0xa
    msgF db "Failed",0xa
    
section .bss
    str1 resb 100
    sub1 resb 100
    sum resb 10
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,14
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80
    
    mov byte[str1+eax-1],0
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,17
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,sub1
    mov edx,100
    int 0x80
    
    mov byte[sub1+eax-1],0
    
    mov esi,str1
    mov edi,sub1
    
loop1:
    mov al,[esi]
    mov bl,[edi]
    test al,al
    jz end
    cmp al,bl
    je loop2
    inc esi
    jmp loop1
    
loop2:
    inc esi
    inc edi
    mov al,[esi]
    mov bl,[edi]
    test bl,bl
    jz done
    cmp al,bl
    je loop2
    xor edi,edi
    mov edi,sub1
    jmp loop1
    
done:
    mov eax,4
    mov ebx,1
    mov ecx,msgS
    mov edx,11
    int 0x80
    jmp exit
    
end:
    mov eax,4
    mov ebx,1
    mov ecx,msgF
    mov edx,7
    int 0x80
    
exit:
    mov eax,1
    int 0x80
   
  
