;.model small
;.stack 50
;.data
;    ntenf DB "text.txt",0
;    fhandle DW ? 
;    readbuff db 51 dup('$')
;    sokitu dw 0
;.code
;main proc
;    mov ax,@data
;    mov ds,ax
;    
;    mov ah,3dh 
;    lea dx,ntenf
;    mov al,02h
;    int 21h
;     
;    mov fhandle,ax
;    
;    ;mov ah,40h
;           
;Lap:    
;    lea dx,readbuff
;    mov bx,fhandle
;    mov cx,50
;    mov ah,3fh
;    
;    int 21h
;    
;    cmp ax,0
;    je thoat
;    
;    mov cx,ax
;    lea si,readbuff
;
;HiThi:    
;    mov ah,02h
;    mov dl,[si]
;    int 21h
;    
;    inc si
;    loop HiThi 
; 
;    jmp Lap
;    
;thoat:   
;       
;    mov ah,3eh
;    mov bx,fhandle
;    int 21h
;    
;    mov ah,4ch
;    int 21h
;    
;    main endp
;end main
;      

.model small
.stack 50
.data
    tep db "text.txt",0
    fhandle dw ?
    readbuff 255,0,255 dup("$")
.code
main proc
    mov ax, @data
    mov ds,ax
    
    lea dx,tep
    mov al,02h
    mov ah, 3dh
    int 21h
    mov fhandle,ax
    
    mov cx,-1
lap:
    lea dx,[readbuff+2]

    mov bx,fhandle
    mov ah,3fh
    int 21h
    cmp ax,0
    je thoat
    jne lap
    
thoat:    
    lea dx,[readbuff+2]     
    mov ah,09h
    int 21h 
    
    mov ah,3eh
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main