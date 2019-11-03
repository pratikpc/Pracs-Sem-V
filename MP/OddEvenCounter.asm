.8086
.model small
.stack 100h

.data
array db 02h, 04h, 06h, 01h, 03h
size_arr db 05h
odd_c db 0h
even_c db 0h
.code
main:
	mov ax, @data
	mov ds, ax

	; Required for Iteration
	lea si, array
	
	looper:
		mov al, [si]

		and al, 1
		jz odd_inc
		jnz even_inc

	odd_inc: inc odd_c
	jmp loop_conditioner
	even_inc: inc even_c
	jmp loop_conditioner

	loop_conditioner: inc si
		dec size_arr
		cmp size_arr, 0h
		jne looper

	mov ah, odd_c
	mov al, even_c

	mov ah, 4ch
	int 21h
end main