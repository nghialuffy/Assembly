.model small
.stack 50
.data
xau1 db "AAA$"
xau2 db "AABA$"
thongbao1 db "xau 1 be hon xau 2 $"
thongbao2 db "xau 1 lon hon xau 2 $"  
thongbao3 db "xau 1 bang xau 2 $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea si,xau1
    lea di,xau2
    
    call sosanh
    
    mov ah,4ch
    int 21h   
    main endp
;Chuong trinh con so sanh 
;2 chuoi duoc dua vao si, di
sosanh proc

lap:
    cmp [di], "$"
    je dihet             
    cmp [si],"$"
    je sihet
    mov al,[di]
    cmp [si],al
    jl sibehon
    jg silonhon
    inc si
    inc di
    jmp lap
sibehon:
    mov ah,09h
    lea dx,thongbao1
    int 21h
    jmp thoat
silonhon:
    mov ah,09h
    lea dx,thongbao2
    int 21h
    jmp thoat
dihet:
    cmp [si],"$"
    je sibangdi
    jne silonhon
sihet:
    cmp [di],"$"
    je sibangdi
    jne sibehon
sibangdi:
    mov ah,09h
    lea dx,thongbao3
    int 21h
    jmp thoat    
thoat:    
    ret
    sosanh endp

end main  




;code by Gio Quy (WE)
;WW   WW   WW   EEEEE
; WW  WW  WW    EE
; WW WWWW WW    EEEEE
;  WW WW WW     EE
;  WW WW WW     EEEEE