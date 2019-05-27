.model small
.stack 50
.data
    manghoa DB 50,0,50 dup('$')  
    thongbao1 DB 10,13,'$'
    thongbao2 DB ' - $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,0ah
    lea dx,manghoa
    int 21h
    xor cx,cx
    lea si,[manghoa+2]
lap:
    cmp [si],'a'
    jge Xuly
    cmp [si],'$'
    je HiThi
    cmp [si],0Dh
    je LHiThi
    inc si
    inc cx
    jmp Lap
Xuly:
    sub [si],20h
    inc si
    inc cx
    jmp lap
LHiThi:
    mov [si],'$'
HiThi:
    mov ah,09h
    lea dx,thongbao1
    int 21h
    
    mov ah,09h
    lea dx,[manghoa+2]
    int 21h
    
    mov ah,09h
    lea dx,thongbao2
    int 21h        
    
    lea si,[manghoa+2]
lap1:
    cmp [si],'A'
    jge Xuly1
    cmp [si],'$'
    je thoat
    inc si
    jmp Lap1
Xuly1:
    add [si],20h
    inc si
    jmp lap1    
    
thoat:
    mov ah,09h
    lea dx,[manghoa+2]
    int 21h        
    mov ah,4ch
    int 21h
    
    main endp
end main