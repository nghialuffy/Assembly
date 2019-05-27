.model small
.stack 50
.data

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,6521h
    mov cx,16
    
    
lap:    
    mov dl,30h
    shl bx,1
    adc dl,0
    
    mov ah,2
    int 21h
    loop lap
    
    
    
    mov ah,4ch
    int 21h
    
endp
end main