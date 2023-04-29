; Set code model to small and define data segment
.model small
.data
a db 92H ; Define byte variable 'a' with initial value 92H

; Start of code segment
.code
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Load value of 'a' into AL and mask lower nibble with 0F0h
    mov al, a
    and al, 0F0h
    ; Rotate the masked nibble 4 times to the right to make it 09h
    rcr al, 4
    ; Store the result in BH
    mov bh, al
    ; Call the 'disp' procedure to display the upper nibble
    call disp
    ; Load value of 'a' into AL and mask upper nibble with 0Fh
    mov al, a
    and al, 0Fh
    ; Store the result in BH
    mov bh, al
    ; Call the 'disp' procedure to display the lower nibble
    call disp

    ; Exit program
    mov ah, 4ch
    int 21h 

; Define 'disp' procedure
disp proc near
    ; Initialize digit count to 2 and bit shift count to 4
    mov ch, 02h
    mov cl, 04h
l2: ; Rotate the value of BH to the right by 4 bits
    rol bh, cl
    ; Load the value to be displayed into DL
    mov dl, bh
    ; Mask DL to get only the LSB
    and dl, 0Fh
    ; Check if the digit is 0-9 or A-F
    cmp dl, 09h
    jbe l4
    ; If digit is a letter, add 7 to it to get ASCII code
    add dl, 07h
l4: ; Add 30h to get ASCII code of digit
    add dl, 30h
    ; Display the character using INT 21h, Function 02h
    mov ah, 02h
    int 21h
    ; Decrement digit count and loop until all digits have been displayed
    dec ch
    jnz l2

    ; Display a space character
    mov ah, 02h
    mov dl, ' '
    int 21h
    
    ; Return from procedure
    ret
disp endp

; End of code segment
end
