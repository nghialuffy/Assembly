.model small
.stack 50
.data
         so db 50, 0 , 50 dup($)
         b1 dw 0   ; so duoc nhap vao
         muoi dw 10
         b2 dw 0   ; tong cac uoc cua so duoc nhap vao
         b3 dw 0  
         hoanhao db 10, 13, "so hoan hao$"
         khh db 10, 13, "Khong hoan hao$"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,so
        mov ah,0Ah
        int 21h
        xor cx,cx
        lea si, so +2
        mov cl, [so + 1]
        
        Lap:
            mov ax,b1
            xor bx,bx
            mov bl, [si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b1,ax 
            inc si
            loop Lap 
           
        mov ax, b1
        mov bx, 2 
        div bx
        mov b3, ax 
        
        mov cx, 1
        Tongu:
        xor dx, dx
        mov ax, b1
        cmp b2, ax
        jae thoat
        div cx
        cmp dx, 0
        jne boqua
        add b2, cx  
        boqua:
        inc cx
        cmp cx, b3
        jle tongu
        
        thoat: 
        mov bx, b1
        cmp bx, b2
        je HH
        lea dx, khh 
        jmp inra
        HH:
        lea dx, hoanhao
        inra:
        mov ah, 9
        int 21h
       
        mov ah,4ch
        int 21h
        main endp
    end main
