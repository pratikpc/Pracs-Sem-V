.model small
.stack 100h

.data
num1 db 09h
num2 db 05h
res db ? ; store reuslt here

.code
start:

; Required to Init Code
mov ax, @data
mov ds, ax

mov ax, 00h
mov al, num1
sub al, num2

mov res, al
mov ah, 4ch
int 21h ; terminate code here
end start