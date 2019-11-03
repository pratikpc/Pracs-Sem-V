.8086
.model small
.stack 100h

.data
string db "Myname0"

char db '3'

msg_found db "Found"
msg_not_found db 'Not Found'

.code
main:
	mov ax, @data
	mov ds, ax
	
	lea si, string

	mov ah, char
	looper:
		mov al, [si]
		
		; End of String
		cmp al, '0'
			je not_found
		inc si
		cmp al, char
		je found
		jne looper
	found:
		lea dx, msg_found
		mov ah, 09h
		int 21h
		jmp exit
	not_found:
		lea dx, msg_not_found
		mov ah, 09h
		int 21h
		jmp exit
	exit:
		mov ah, 4ch
		int 21h

end main