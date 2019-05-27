.model small
.stack 50
.data
    chia10 dw 10       
    dau db " : $"
    xuonghang db 10,13,"$"
.code
print Macro thongbao   
    lea dx,thongbao
    mov ah,09h
    int 21h    
print endm
main proc
    mov ax, @data
    mov ds,ax
    
    
Lap:
    mov ah,2ch
    int 21h
        
    mov ah,0h
    mov al,ch
    call printDec
    print dau
    
    mov ah,2ch
    int 21h
     
    mov ah,0h
    mov al,cl
    call printDec
    print dau
    
    mov ah,2ch
    int 21h 
    
    mov ah,0h
    mov al,dh
    call printDec
    
    print xuonghang
    jmp Lap
    
    
    mov ah,4ch
    int 21h   
    main endp


printDec proc
    xor cx,cx    
LapChia:
    xor dx,dx
    div chia10
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne LapChia
Docstack:
    pop dx
    mov ah,02h
    int 21h
    loop Docstack
    ret
printDec endp



end main