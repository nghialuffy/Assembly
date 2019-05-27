.model small
.stack 50
.data
    nhan16 dw 2
    chia16 dw 10
    thongbao db 10,13,'Gia tri : $'
.code

main proc
    mov ax,@data
    mov ds,ax 
    
    mov cx,16
Lap:    
    mov ah,1
    int 21h
    
    sub al,30h
    
    shl bx,1
    add bl,al
    loop Lap
    
    mov ax,bx
    xor cx,cx
LapChia:
    xor dx,dx
    div chia16
    add dx,30h
    push dx
    
    inc cx
    
    cmp ax,0
    jne LapChia
    
    mov dx,offset thongbao
    mov ah,09h            
    int 21h
    
Docstack:
    pop dx
    mov ah,2
    int 21h
    loop Docstack
    
    
    
    mov ah,4ch
    int 21h
    
endp
end main