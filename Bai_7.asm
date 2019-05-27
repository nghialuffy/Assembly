.model small
.stack 50
.data
    mang db 100 dup(?)
    thongbao db 10,13,'Mang do la: $' 
    thongbao1 db 10,13,'so phan tu la: $' 
    count dw 0h
    chia16 dw 10
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov si,offset mang
    xor cx,cx
    
Nhap:
    mov ah,01h
    int 21h
    
    mov [si],al
    cmp [si],0Dh
    je Inthongbao
    inc si
    inc cx
    inc count
    jne Nhap
     
Inthongbao:
        
    mov dx,offset thongbao
    mov ah,09h
    int 21h 
    
    mov si,offset mang
    
HThi:
    mov dl,[si]
    mov ah,02h
    int 21h
    
    inc si
    loop HThi
    
    xor cx,cx
    mov ax,count
    
sophantu: 
    xor dx,dx
    div chia16
    
    add dx,30h
    
    push dx
    
    inc cx
    cmp ax,0
    jne sophantu
    
    mov dx,offset thongbao1
    mov ah,09h
    int 21h
    
Docstack:
    pop dx
    mov ah,02h
    int 21h
    loop Docstack
    
    
    
    mov ah,4ch
    int 21h
endp
end main