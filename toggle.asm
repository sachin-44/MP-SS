section .data
	msg1 db 'Enter the string:',0xa
	msg2 db 'Toggled string:',0xa
	
section .bss
	str1 resb 100
	tog resb 100
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,17
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov byte[str1+eax-1],0
	
	mov esi,str1
	mov edi,tog
	
	loop:
		mov al,[esi]
		test al,al
		jz done
		cmp al,'a'
		jb check_upper
		cmp al,'z'
		ja check_upper
		sub al,32
		jmp store_char
		
	check_upper:
		cmp al,'A'
		jb store_char
		cmp al,'Z'
		ja store_char
		add al,32
		
	store_char:
		mov [edi],al
		inc esi
		inc edi
		jmp loop
		
	done:
		mov byte[edi],0
		
		mov eax,4
		mov ebx,1
		mov ecx,msg2
		mov edx,17
		int 0x80
		
		mov eax,4
		mov ebx,1
		mov ecx,tog
		mov edx,edi
		sub edx,tog
		int 0x80
		
		mov eax,1
		xor ebx,ebx
		int 0x80
		
