.8086
.model small
.stack 100h

.data
string db "maddam"
count_size dw 06h
i db 0h
.code
main:
	mov ax, @data
	mov ds, ax

	; We know Palindrome has all digits same
	; So Digit 1 = Digit 5
	;    Digit 2 = Digit 4
	;    Digit 3 = Digit 3 (Ignore)

	lea si, string
	; Let's tale DI to the end
	lea di, string
	add di, count_size
	dec di

	looper:
		mov al, [si]
		mov bl, [di]

		cmp al, bl
		jne not_palin

		sub count_size, 2
		dec di
		inc si

		cmp count_size, 1
		jle palin
		jmp looper
		
	palin:
		mov al, 21h
		jmp exit
	not_palin:
		mov al, 33h
		jmp exit
	exit:
		mov ah, 4ch
		int 21h
end main