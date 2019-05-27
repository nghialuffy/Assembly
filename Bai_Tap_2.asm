.model small
.stack 50
.data
    nfile db 'test.txt',0
    mang db 20 dup(?)
    fhandle dw ?
    count dw ? 
    scount dw ?
    readmang db 100 dup('$')
    xuonghang db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,3ch
    lea dx,nfile
    mov cx,00h
    int 21h
    
    mov fhandle,ax
    lea si,[mang]
    mov count,0
Lap:    
    mov ah,01h
    int 21h
    
    mov [si],al
    
    cmp [si],0Dh
    je Thoat
    
    inc si
    inc scount 
    inc count
    cmp count,14h
    je Doc
    jne Lap

Doc:
    mov ah,40h
    lea dx,mang
    mov bx,fhandle
    mov cx,20
    int 21h
    
    mov cx,count
    mov count,0
    
    lea si,mang
Xoamang:
    mov [si],0
    inc si
    loop Xoamang
    lea si,mang 
        
    jmp Lap
   
Thoat:
    mov ah,40h
    lea dx,mang
    mov bx,fhandle
    mov cx,20
    int 21h
    
    ;dong file
   
    mov ah,3eh
    mov bx,fhandle
    int 21h
    
    ;mo file
    
    mov ah,3dh
    mov al,00h
    lea dx,nfile
    int 21h     
    
    mov fhandle,ax
    
    lea dx,readmang  
    mov bx,fhandle
    mov cx,scount
    mov ah,3fh
    int 21h    
    
Ketthuc:

    mov ah,09h
    lea dx,xuonghang
    int 21h
    
    mov ah,09h
    lea dx,[readmang]
    int 21h
    
    mov ah,3eh
    mov bx,fhandle
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
