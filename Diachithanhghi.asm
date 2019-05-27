.model small
.stack 50h  
.data
    bien1 DB 5 
    bien2 DB 9 dup(7)
    bien3 DB ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        
        lea si,bien1
        
        mov [si],1234h   
        
        mov [3],55h 
        
        mov bien3,offset [3]
        
        mov ah,4ch
        int 21h
    main endp
end main
