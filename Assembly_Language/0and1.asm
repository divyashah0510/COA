.model small        ; define the memory model
.stack              ; reserve space for the stack
.data               ; declare the data segment
num db 10110101b    ; 8-bit number to count 1's and 0's
ones db 0           ; count of 1's
zeros db 0          ; count of 0's
.code               ; declare the code segment
mov ax, @data       ; initialize data segment
mov ds, ax          ; move data segment address to ds
mov al, num         ; load the number in al
mov cx, 8           ; initialize counter to 8 bits
l1:                 ; start of loop to check all bits
shr al, 1           ; shift right to get next bit
jc l2               ; jump to l2 if it's a 1
inc zeros           ; increment count of 0's
jmp l3              ; jump to l3
l2:                 ; if it's a 1
inc ones            ; increment count of 1's
l3:
loop l1             ; repeat for all 8 bits
mov ah, 4ch         ; terminate program
int 21h             ; DOS system call
end                 ; end of program
