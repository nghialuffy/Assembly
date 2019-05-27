.model small
.stack 50

.data
    so db 255,0,255 dup(13) 
    xuonghang db 10,13,"Nhap so : $" 
    ketqua db 10,13,"So do la : $"
    x dw 0
    bien1 dw 0
    bien2 dw 0
    
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    call NhapHex
    mov dx,x
    mov bien1,dx
    
    call NhapHex
    mov dx,x
    mov bien2,dx 
    
;Cong    
    mov ax,bien1
    mov bx,bien2
    
    add bx,ax
    
    mov ah,09h
    lea dx,ketqua
    int 21h
    
    mov cx,16
InKQ0:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,02h
    int 21h
    loop InKQ0
    
;Tru
    mov ax,bien1
    mov bx,bien2
    
    sub ax,bx
    mov bx,ax
    
    mov ah,09h
    lea dx,ketqua
    int 21h
    
    mov cx,16
InKQ1:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,02h
    int 21h
    loop InKQ1
;and
    mov ax,bien1
    mov bx,bien2
    
    and bx,ax
    
    mov ah,09h
    lea dx,ketqua
    int 21h
    
    mov cx,16
InKQ2:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,02h
    int 21h
    loop InKQ2
;or
    mov ax,bien1
    mov bx,bien2
    
    or bx,ax
    
    mov ah,09h
    lea dx,ketqua
    int 21h
    
    mov cx,16
InKQ3:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,02h
    int 21h
    loop InKQ3    
    
    
    
        
    mov ah,4ch
    int 21h
    main endp  

NhapHex proc 
    
    mov ah,09h
    lea dx,xuonghang
    int 21h
    
    
    mov ah,0ah
    lea dx,so
    int 21h
    
    mov x,0
    lea si,[so+2]
    mov bx,16
    xor cx,cx
    
    lea si,[so+2]
Lap:
    xor ax,ax
    cmp [si],0dh
    je Thoat
    cmp [si],40h
    jg Tru31
Tiep:
    sub [si],30h
    mov ax,x
    mul bx
    add al,[si]
    mov x,ax
    inc si
    
    jmp lap
Tru31:
    sub [si],07h
    jmp Tiep 
    
Thoat:
    ret
NhapHex endp

    
end main