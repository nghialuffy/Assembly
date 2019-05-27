.model small
.stack 50
.data
    chia16 dw 2
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,1234h
    xor cx,cx
    
lap:
    xor dx,dx    
    div chia16
    
    add dx,30h
    
    push dx
    
    inc cx
    cmp ax,0
    
    jne lap 
        
    
Docstack:
    pop dx
    mov ah,2
    int 21h
    loop Docstack
    
    
    
    mov ah,4ch
    int 21h
    
endp
end main