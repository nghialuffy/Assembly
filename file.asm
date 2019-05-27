.model small
.stack 50
.data
    ntenf DB "text.txt"
    fhandle DW ? 
    readbuff db 51 dup('$')
    sokitu dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,3dh 
    lea dx,ntenf
    mov al,02h
    int 21h
     
    mov fhandle,ax
    
    mov ah,40h
           
Lap:    
    lea dx,readbuff
    mov bx,fhandle
    mov cx,50
    mov ah,3fh
    
    int 21h
    
    cmp ax,50
    
    jl thoat
    
    lea dx,readbuff
    mov ah,09h
    int 21h

      
    jmp Lap
    
thoat:
    mov sokitu,ax 
    mov ah,02h
    lea dx,sokitu
    int 21h
    lea si,readbuff
    add si,ax  
    mov [si],'$'
   
    lea dx,readbuff
    mov ah,09h
    int 21h
       
    mov ah,3eh
    mov bx,fhandle
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main
