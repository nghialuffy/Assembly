.model small
.stack 50
.data
    chia8 DB 10
    chia16 DW 10 
    so DB ?
.code    
    main proc
        mov ax,@data
        mov ds,ax
        
        ;xor dx,dx
        ;mov ax,2567
        ;div chia16
        
        ;mov dx,1
        ;mov ax,0
        ;div chia16
        
        
        
        mov ax,2019 
        xor cx,cx
LapChia:
        xor dx,dx         
        ;div chia16
        div chia8   ;chia8
        
        ;add dx, 30h  
        add ah,30h  ;chia8
        mov dl,ah   ;chia8
        
        push dx
        
        inc cx
        xor ah,ah   ;chia8
        cmp ax,0
        
        jne LapChia
Docstack:        
        pop dx
        mov ah,2
        int 21h
        loop Docstack 
         
         
         
        mov ah,4ch
        int 21h
    endp
    end main
    
