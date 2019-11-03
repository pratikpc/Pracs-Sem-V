.8086
.model small
.stack 100h

.data
num1 db 03h
num2 db 05h
result db ? ; Store Result here

.code
start:
mov ax, @data
mov ds, ax
mov ah, 00h

mov al, num1
add al, num2 ; Stores result in al itself

mov result, al
mov ah, 4ch
int 21h ; End Program
end start