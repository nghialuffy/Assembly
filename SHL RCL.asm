.model small
.stack 50
.data
    thongbao db 10,13,'So do la : $'
.code
main proc
    mov ax,@data
    mov ds,ax
;In 16bit    
    ;mov bx,1234h
;    mov cx,16
;Lap:
;    mov dx,30h
;    shl bx,1
;    adc dx,0
;    mov ah,02h
;    int 21h
;    loop Lap

;Nhap va in 16bit    
;    mov bx,0
;    mov cx,16
;Lap:
;    mov ah,01h
;    int 21h
;    sub al,30h
;    shl bx,1
;    add bl,al
;    loop Lap
;             
;    mov ah,09h
;    lea dx,thongbao
;    int 21h         
;             
;    mov cx,16
;Lap1:
;    mov dx,30h
;    shl bx,1
;    adc dx,0
;    mov ah,02h
;    int 21h
;    loop Lap1

;Daobit    
    mov bx,1234h
    mov cx,16
Lap:
    shl bx,1
    rcr dx,1
    loop Lap    
    
    mov bx,dx
    mov cx,16
Lap1:
    mov dx,30h
    shl bx,1
    adc dx,0
    mov ah,02h
    int 21h
    loop Lap1
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main