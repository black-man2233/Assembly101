stack segment para stack
	db 64 dup ('_')
stack ends
data segment
	string db 'Hello World, from Assembly!','$'
;	include proc.inc
data ends

code segment
	assume cs:code, ds:data, ss:stack
	mov ax,data
	mov ds,ax
	mov ax,stack
	mov ss,ax

	main proc
	
		call show_string
		
		mov ah, 4ch
		int 21h
	
	main endp
	
	show_string proc
	
		mov ah, 09h
		lea dx, string
		int 21h

		ret
	show_string endp

code ends
end