.model small
.stack 50
.data
thongbao1 DB 10,13,'Nhap 1 ki tu tu ban phim: $'
thongbao2 DB 10,13,'Ki tu do la: $' 
bien DB ?
.code
main proc
    mov ax, @data
    mov ds, ax
     
     
     mov dx,offset thongbao1
     mov ah,09h
     int 21h
     
     mov ah,01h
     int 21h   
     
     mov bien,al 
     
     mov dx,offset thongbao2
     mov ah,09h
     int 21h
    
     mov dl,bien
     
     mov ah,02h
     int 21h

     mov ah,4Ch
     int 21h
    
main endp
end main

