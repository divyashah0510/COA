.model small
.code
start:
mov si,1000h        ;Move source address to si
mov di, 4000h       ;Move destination address to di
mov cl,05h          ;Set loop counter to 5 (for 5 numbers)
loop1:              ;loop1
mov bl,[si]         ;move the content of si to bl
mov [di],bl         ;move the byte from bl to di 
inc si              ;increment si
inc di              ;increment di
dec cl              ;decrement cl
jnz loop1           ;jump if not zero to loop1  
int 03h             ;Interrupt to end the program
end start