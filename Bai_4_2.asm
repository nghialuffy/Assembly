.model small
.stack 50
.data
    mang DB 50,0,50 dup('$')
    thongbao1 DB 10,13,'Nhap xau : $'
    thongbao2 DB 10,13,'Xin Chao $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,thongbao1
    int 21h         
    
    mov ah,0ah
    lea dx,mang
    int 21h
    
    lea dx,thongbao2
    mov ah,09h
    int 21h
                   
    mov ah,09h
    lea dx,[mang+2]
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main