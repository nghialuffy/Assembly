.model small 
.stack 50
.data

.code

main proc
    mov ax,@data
    mov dx,ax
    
    mov cx,0
Lap:
    mov ah,02h
    mov dl,'A'
    int 21h
    loop Lap
    
main endp
end main