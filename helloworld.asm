.model small
.stack 50
.data      
    xau DB 'Nhap xau ki tu: $'    
    xau1 DB 10,13,'Ky tu nhap: $'
    kytu DB ?
.code
main proc
    mov ax, @data
    mov ds, ax        
    
     
    mov dx,offset xau   ;lea dx,xau
    mov ah, 09h
    int 21h
    
    mov ah,01h
    int 21h   
    
    mov kytu,al
           
    lea dx,xau1
    mov ah, 09h
    int 21h
           
    
    mov ah,02h 
    mov dl,kytu
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main