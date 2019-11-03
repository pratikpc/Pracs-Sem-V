.8086
.model small
.stack 100h

.data
array db 10h, 20h, 30h, 40h
size_cnt db 04h
size_total db 04h
avg db 0h

.code
main:
	mov ax, @data
	mov ds, ax

	lea si, array ; Copy to Array

	looper:
		mov al, [si]
		add avg, al
		inc si
		dec size_cnt
		cmp size_cnt, 0
		jne looper

	mov ah, 00h
	mov al, avg
	div size_total

	mov ah, 4ch
	int 21h

end main