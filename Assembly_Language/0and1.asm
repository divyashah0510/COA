.model small 
.data 
n1 db 31h               ;Intialize n1 with value 31h (ASCII code for '1')
zeros db 1 dup(0)       ; Define variables to hold count of zeros
ones db 1 dup(0)        ;Define variables to hold count of ones
.code 
start: 
mov ax,@data            ;Initialize the data segment
mov ds,ax               
mov cl,08h              ;Intialize the counter to 8(number of bits in n1)
mov ah,00h              ;clear the register
mov al,n1               ;Load n1 into al register
mov dx,0000h            ;Initialize the dx register with 0000h
up: 
rcl al,01H              ;Rotate left through carry flag is set
JC next                 
inc dl                  ;Increment count of zeros in dl register
jmp down                ;Jump down to the label
next: 
inc dh                  ;Increment count of ones in dh register
down:
loop up                 ;Decrement counter and loop until it reaches zero
mov zeros, dh           ;Store count of zeros in zero register
mov ones,dl             ;Store count of ones in ones variable
int 03H                 ;Interrupt to break and end the program             
end Start