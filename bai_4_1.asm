.model small
.stack 50
.data
thongbao1 DB 10,13,'Ten Ban La: $'
thongbao2 DB 10,13,'Xin chao $'
chuoi DB 255,7 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
     
     ;Thong bao nhap
     mov dx,offset thongbao1
     mov ah,09h
     int 21h
     ;Nhap vao chuoi
     mov ah,0Ah
     lea dx,chuoi
     int 21h 
     ;Thong bao xuat
     mov dx,offset thongbao2
     mov ah,09h
     int 21h
     ;Dua dia chi offset vao Bx
     lea bx, chuoi
     ;Dua bx+1 vao dl
     mov dl,[bx+1]
     mov dh,00h
     add bx,dx
     mov [bx+2],"$"
     
     mov ah,09h 
     lea dx,chuoi
     add dx,02h
     int 21h
     

     mov ah,4Ch
     int 21h
    
main endp
end main

