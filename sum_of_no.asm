section .data
    msg1 db "enter no.1 :"
    msg2 db "enter no.2 :"
    msgs db "sum : "
    
section .bss
    num1 resw 10
    num2 resw 10
    sum resw 10
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,12
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,num1
    mov edx,10
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,12
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,10
    int 0x80
    
    ;mov eax,[num1]
    ;sub eax,30
    ;mov [num1],eax
    
    mov eax,[num2]
    sub eax,'0'
    ;sub eax,30
    mov ecx,[num1]
    sub ecx,'0'
    add eax,ecx
    add eax,'0'
    ;add eax,30
    mov [sum],eax
    
    mov eax,4
    mov ebx,1
    mov ecx,msgs
    mov edx,6
    int 0x80
    
     mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,10
    int 0x80
    
    mov eax,1
    int 0x80
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
