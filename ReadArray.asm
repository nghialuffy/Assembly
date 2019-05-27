.model small
.stack 50
.data
    mang db 10 dup(?)
    thongbao db 10,13,'Mang do la : $'
.code                    

main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset mang
    mov cx,10

Doc:    
    mov ah,01h
    int 21h
    
    mov [si],al
    inc si
    loop Doc
    
    mov cx,10
    
    mov dx,offset thongbao
    mov ah,09h
    int 21h
    
    mov si,offset mang
HTHI:
    mov dl,[si]
    mov ah,02h
    int 21h
    
    inc si
    
    loop HTHI
    
    
    mov ah,4ch
    int 21h
endp
end main
