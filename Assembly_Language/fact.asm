.model small
.stack 100h
.data
n dw 5      ; define a word-sized variable n and initialize it with 5
fact dw 1   ; define a word-sized variable fact and initialize it with 1
.code
start:
mov ax, @data    ; initialize data segment
mov ds, ax
mov bx, n        ; move value of n into bx register
mov cx, bx       ; move value of n into cx register
; loop to calculate factorial
fact_loop:
mul bx          ; multiply ax by bx and store the result in ax
dec bx          ; decrement bx
cmp bx, 0       ; compare bx with 0
jne fact_loop   ; jump to fact_loop if bx is not equal to 0
mov fact, ax    ; move value of ax into fact
mov ah, 4ch     ; DOS exit function
int 21h         ; call DOS
end start
