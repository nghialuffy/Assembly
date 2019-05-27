.model small
.stack 50
.data       
    xau1 DB 'Hay go 1 phim:$'     
    kytu DB ?
    xau2 DB 10,13,'Ky tu ke truoc:$'
    xau3 DB 10,13,'Ky tu ke sau:$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset xau1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    mov kytu,al
              
    lea dx,xau2
    mov ah,09h 
    int 21h
    
    mov dl,kytu 
    dec dl
    mov ah,02h
    int 21h
            
    lea dx,xau3
    mov ah,09h 
    int 21h
    
    mov dl,kytu
    inc dl
    mov ah,02h
    int 21h
    
    
         
    mov ah,4Ch
    int 21h
main endp
end main