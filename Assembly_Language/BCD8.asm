.model small  ; Declare the memory model to be used
.data  ; Declare the data section
num1 db 23h  ; Declare an 8-bit variable called "num1" and initialize it with the value 23h (decimal 23)
num2 db 42h  ; Declare another 8-bit variable called "num2" and initialize it with the value 42h (decimal 42)
result db 0  ; Declare a third 8-bit variable called "result" and initialize it with the value 0
.code  ; Begin the code section of the program
start:  ; Define the entry point of the program
mov ax, @data  ; Initialize data segment register (DS) with address of data section
mov ds, ax  ; Set DS register to the address of the data section
mov al, num1  ; Load the value of "num1" into the AL register
aam  ; Convert AL from binary to unpacked BCD format (each nibble represents a decimal digit)
mov bl, al  ; Store the low nibble (least significant digit) of AL in BL
mov al, num2  ; Load the value of "num2" into the AL register
aam  ; Convert AL from binary to unpacked BCD format
add bl, al  ; Add the low nibble of AL to the low nibble of BL
daa  ; Adjust the result of the addition (handle any carry or overflow)
mov al, bl  ; Move the contents of BL back into AL
aas  ; Convert AL from unpacked BCD to binary format
mov result, al  ; Move the result of the addition (in binary format) into the "result" variable
mov ah, 4Ch  ; Set the AH register to 4Ch (DOS function for terminating a program)
int 21h  ; Call the DOS interrupt 21h to terminate the program
end start  ; End the program and set the entry point to "start"