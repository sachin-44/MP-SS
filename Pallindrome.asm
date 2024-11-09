section .data
	msg db "Enter a String:",0xa
	len equ $-msg
	msg1 db "Pallindrome",0xa
	len1 equ $-msg1
	msg2 db "Not Pallindrome",0xa
	len2 equ $-msg2
section .bss
	str1 resb 100
	rev resb 100
section .text
	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov byte[str1+eax-1],0
	mov ecx,eax
	dec ecx
	
	mov esi,str1
	mov edi,rev
	add esi,ecx
	dec esi
reverse: 
	mov al,[esi]
	mov [edi],al
	inc edi
	dec esi
	loop reverse
	
	mov byte[edi],0
	
	mov esi,str1
	mov edi,rev	
cmp:
	mov al,[esi]
	mov bl,[edi]
	cmp al,bl
	jne not_eq
	inc esi
	inc edi
	test al,al
	jz end
	test bl,bl
	jz not_eq
	jmp cmp
end:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80
	jmp exit
not_eq:
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
	
