.model small  ; declare the memory model

.data
a dw 3629H  ; define variable 'a' with initial value 3629H (stored in memory)
b dw 4738H  ; define variable 'b' with initial value 4738H (stored in memory)

.code
    mov ax, @data  ; initialize the data section
    mov ds, ax     ; set DS register to point to the data segment

    mov ax, a      ; load number1 (3629H) into AX register
    mov bx, b      ; load number2 (4738H) into BX register

    add al, bl     ; add the lower two digits (9+8=17) and store result in AL register
    daa            ; adjust the result in AL register to valid BCD format (decimal 17 is converted to BCD 23H)
    mov bl, al     ; store the BCD result from AL register into BL register

    adc ah, bh     ; add the upper two digits (2+3+3=8) and store result in AH register
    mov al, ah     ; copy the result from AH register to AL register (DAA instruction only works on AL register)
    daa            ; adjust the result in AL register to valid BCD format (decimal 8 is already valid BCD)

    mov bh, al     ; store the BCD result from AL register into BH register

    mov ch, 04h    ; set the loop counter (CH register) to 4 (for 4 BCD digits)
    mov cl, 04h    ; set the roll count (CL register) to 4 (to extract each BCD digit)

l2:
    rol bx, cl     ; roll the BL register left by 4 bits (so that the MSB becomes LSB)
    mov dl, bl     ; move the contents of BL register to DL register (to extract the LSB)
    and dl, 0fH    ; mask the lower 4 bits to extract the LSB (BCD digit)

    cmp dl, 09     ; compare the LSB (BCD digit) with 9 (to check if it's a digit or a letter)
    jbe l4         ; jump to l4 if it's a digit (less than or equal to 9)

    add dl, 07h    ; add 7H to the LSB (to convert it to a letter)
    jmp l5         ; jump to l5

l4:
    add dl, 30h    ; add 30H to the LSB (to convert it to an ASCII digit)

l5:
    mov ah, 02h    ; set the function code for printing a character (INT 21H)
    int 21h        ; invoke the interrupt to print the character in DL register

    dec ch         ; decrement the loop counter
    jnz l2         ; jump to l2 if the loop counter is not zero

    mov ah, 4ch    ; set the function code for terminating the program (INT 21H)
    int 21h        ; invoke the interrupt to terminate the program

    end           ; end the program
