.model small
.stack 50
.data
    chuoi db 50,0,50 dup(13)
    x dw ?
    y dw ?
    thongbao DB 10,13,'- $'
.code

main proc
    mov ax,@data
    mov ds,ax
    mov ah,09h
    lea dx,thongbao
    int 21h
    lea dx,chuoi 
    mov ah,0ah
    int 21h
    lea si,[chuoi+2]
    mov ax,0
    mov bx,10
    mov x,0   
Nhapx:         
    cmp [si],0Dh    
    je Next
    sub [si],30h   
    mov ax,x   
    mul bx
    add al,[si]
    mov x,ax
    inc si    
    jmp Nhapx:
Next:
    mov ah,09h
    lea dx,thongbao
    int 21h
    lea dx,chuoi 
    mov ah,0ah
    int 21h
    lea si,[chuoi+2]
    mov ax,0
    mov bx,10
    mov y,0   
Nhapy:         
    cmp [si],0Dh    
    je HiThi
    sub [si],30h
    mov ax,y   
    mul bx
    add al,[si]
    mov y,ax
    inc si    
    jmp Nhapy:        
HiThi:
    xor ax,ax
    mov ax,x
    add ax,y
    mov bx,10
    xor cx,cx
Doc:
    xor dx,dx        
    div bx   
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne Doc
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