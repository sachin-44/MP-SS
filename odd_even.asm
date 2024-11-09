section .data
    msg db "enter number :"
    msgO db "ODD",0xa
    msgE db "EVEN",0xa
    
section .bss
    num1 resb 100
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,14
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,num1
    mov edx,100
    int 0x80
    
   mov eax,[num1]
   add eax,'0'
   and eax,1
   jz even
   jmp odd
    
even:
    mov eax,4
    mov ebx,1
    mov ecx,msgE
    mov edx,5
    int 0x80
    jmp exit
    
odd:
    mov eax,4
    mov ebx,1
    mov ecx,msgO
    mov edx,4
    int 0x80
    
exit:
    mov eax,1
    int 0x80
   
  
