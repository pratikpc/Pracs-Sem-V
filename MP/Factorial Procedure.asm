.8086
.model small
.stack 100h

.data
fact dw 00h
val dw 04h

.code
; Value Sent to ax macro
factorial proc
	mov ax, 1
	mov bx, val
	looper:
		mul bx
		sub bx, 1
		cmp bx, 2
		jg looper
		ret
endp

start:
	mov ax, @data
	mov ds, ax

	call factorial
	
	mov ah, 4ch
	int 21h
end start