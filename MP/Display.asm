.8086
.model small

.data
msg db "Display"
m3sg db "Display"

.code
start:

; Set up Data
; Initialise Memory
mov ax, @data
mov ds, ax

; Display
lea dx, msg
mov ah, 09h
int 21h
; Display Done

; Display
lea dx, m3sg
mov ah, 09h
int 21h
; Display Done


; Quit
mov ah, 4ch
int 21h
end start