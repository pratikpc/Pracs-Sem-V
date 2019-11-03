.8086
.model small

.data
msg_add db "Add"
msg_sub db "Sub"

num1 dw 04h
num2 dw 02h
res dw ?
.code
start:

; Set up Data
; Initialise Memory
mov ax, @data
mov ds, ax

; Display
lea dx, msg_add
mov ah, 09h
int 21h
; Display Done

; Display
lea dx, msg_sub
mov ah, 09h
int 21h
; Display Done

; Input
; For Input
mov ah, 08h
int 21h;
; al will now contain input
; End Input

jmp adder

adder:
	cmp al, 31h
	jne subber
	mov bx, 00h
	mov bx, num1
	add bx, num2
	jmp exit
	cmp al, 32h
subber:	cmp al, 32h
	jne exit
	mov bx, 00h
	mov bx, num1
	sub bx, num2
	jmp exit

; Quit

exit: mov res, bx
mov ah, 4ch
int 21h


end start