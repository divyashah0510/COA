.model small
.stack 100h

.data
src db 10, 20, 30, 40, 50 ; source array
dest db 5 dup (?) ; destination array

.code
main proc
    mov ax, @data ; initialize data segment
    mov ds, ax

    mov si, offset src ; load source address into SI
    mov di, offset dest ; load destination address into DI
    mov cx, 5 ; number of bytes to copy
    cld ; clear direction flag (forward copy)
    rep movsb ; copy bytes from source to destination

    mov ah, 4ch ; exit program
    int 21h
main endp
end main
