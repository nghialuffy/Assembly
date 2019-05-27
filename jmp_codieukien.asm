.model small
.stack 100h  
.data
    tb1 DB 10,13,'Nhap ki tu : $'
    tb2 DB 10,13,'La chu cai$'
    tb3 DB 10,13,'La chu so$' 
    kytu DB ?
.code
    main proc
        mov ax,@data
        mov ds,ax
               
        mov dx,offset tb1
        mov ah,09h
        int 21h
        
        mov ah,01h
        int 21h
        
        mov kytu,al
        
        cmp kytu,'A'
        jb So
        cmp kytu,'Z'
        ja sosanhthuong
        jmp Chu
        
sosanhthuong:
        cmp kytu,'a'
        jb So
        cmp kytu,'z'
        ja So
        jmp Chu
So:
        mov dx,offset tb3
        mov ah,09h
        int 21h  
        jmp thoat
Chu:
        mov dx,offset tb2
        mov ah,09h
        int 21h 
        jmp thoat
        
        
thoat:        
        mov ah,4ch
        int 21h
    main endp
end main
