.model small
.stack 50
.data
    nfile db "test1.txt"
    kt db ?
    mes db "Le Van Nghia"
    fhandle dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,3ch
    lea dx,nfile
    mov cx,0
    int 21h
    
    mov fhandle,ax
Lap:    
    mov ah,01h
    int 21h
    
    mov kt,al
    
    cmp al,0Dh
    je Thoat
    
    mov ah,40h
    lea dx,kt
    mov bx,fhandle
    mov cx,1
    int 21h
    
    jmp Lap
   
Thoat:    
    mov ah,3Eh
    mov bx,fhandle
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main
