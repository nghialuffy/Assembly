.model small
.stack 50
.data
    
    thongbao db 10,13,'So do la : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,16
    xor bx,bx
Lap:
    mov ah,01h
    int 21h
    sub al,30h
    shl bx,1
    add bl,al
    Loop Lap
    
    mov ax,bx
    mov bx,10
    xor cx,cx
HiThi:        
    xor dx,dx
    div bx
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne HiThi
    
    lea dx,thongbao
    mov ah,09h
    int 21h
    
Docstack:
    pop dx
    mov ah,02h
    int 21h
    Loop Docstack    
    
    mov ah,4ch
    int 21h
    main endp
end main