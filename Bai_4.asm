.model small
.stack 50
.data 
morning DB 10,13,'Good morning$'
afternoon DB 10,13,'Good Afternoon$'
everning DB 10,13,'Good everning$'  
kytu DB ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,01h
    int 21h
    
    mov kytu,al 
    
    cmp kytu,'S'
    JE ChaoBuoiSang 
    cmp kytu,'s'
    JE ChaoBuoiSang
    
    cmp kytu,'T'
    JE ChaoBuoiChieu 
    cmp kytu,'t'
    JE ChaoBuoiChieu
    
    cmp kytu,'C'
    JE ChaoBuoiToi 
    cmp kytu,'c'
    JE ChaoBuoiToi
    
ChaoBuoiSang: 
    mov dx, offset morning
    mov ah,09h            
    int 21h
    jmp Thoat
ChaoBuoiChieu: 
    mov dx, offset afternoon
    mov ah,09h            
    int 21h
    jmp Thoat                 
ChaoBuoiToi: 
    mov dx, offset everning
    mov ah,09h            
    int 21h
    jmp Thoat
    
  
    
    
Thoat:        
    mov ah,4ch
    int 21h
    
main endp
end main