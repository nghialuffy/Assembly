.model small
.stack 50
.data  
kytu DB ?
space DB " $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,01h
    int 21h 
    mov kytu,al
    
    
Lap:
    mov dl,kytu
    cmp dl,'z'
    JNG DisPlay  
    JG Thoat
DisPlay:        
    mov ah,02h 
    int 21h
    inc dl
    mov kytu,dl
    
    mov ah,02h
    mov dl,space
    int 21h 
 
    
    jmp Lap
    
    
    
    
Thoat:    
    mov ah,4ch
    int 21h
main endp
end main