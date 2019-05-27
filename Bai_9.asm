.model small
.stack 50
.data
    a dw ?
    b dw ?
    x dw ?
    y dw ?
    xau db 10,13,'Nhap so : $' 
    thongbao db 10,13,'So do la : $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,xau
    int 21h   
    
    mov a,0
    mov b,0
    mov bx,10
    
Nhapx:
    mov ah,01h
    int 21h
    cmp al,0dh
    je Next
    sub al,30h
    xor ah,ah
    mov b,ax
    mov ax,a
    mul bx
    add ax,b
    mov a,ax
    loop Nhapx   
Next: 
    mov ax,a
    mov x,ax
    mov ah,09h
    lea dx,xau
    int 21h
        
    mov a,0
    mov b,0
    mov bx,10
    
Nhapy:
    mov ah,01h
    int 21h
    cmp al,0dh
    je HiThi
    sub al,30h
    xor ah,ah
    mov b,ax
    mov ax,a
    mul bx
    add ax,b
    mov a,ax
    loop Nhapy    
HiThi:
    mov ax,a
    mov y,ax
    mov ax,x
    mov bx,y
    
    
        
    add ax,bx
    mov bx,10d
    xor cx,cx
Lap:         
    xor dx,dx
    div bx
    
    add dx,30h
    
    push dx
    
    inc cx
    cmp ax,0
    jne Lap
    
    mov ah,09h
    lea dx,thongbao
    int 21h
    
Docstack:
    pop dx
    mov ah,02h
    int 21h
    loop Docstack
    
    
thoat:        
    mov ah,4ch
    int 21h
    
    main endp
end main