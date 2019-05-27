.model small
.stack 50
.data
    chuoi db 255,0,255 dup(13)
    x dw ?
    sum dw ?
    thongbao db 10,13,'Trung Binh Cong la : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,0ah
    lea dx,chuoi
    int 21h    
    
    mov sum,0
    lea si,[chuoi+2]
    xor cx,cx
    mov bx,10
Lap:
    mov x,0
    xor ax,ax
    cmp [si],0dh
    je next
    cmp [si],20h
    jne LaySo
    je Reso
LaySo:
    cmp [si],0dh
    je Reso
    cmp [si],20h
    je Reso
    sub [si],30h
    mov ax,x
    mul bx
    add al,[si]
    mov x,ax
    inc si
    jmp LaySo
Reso:
    mov ax,x
    add ax,sum
    mov sum,ax
    cmp [si],0dh
    inc cx
    je next
    inc si      
    jmp Lap    
next:
    mov ax,sum
    div cx
    mov bx,10
    xor cx,cx
HiThi:
    xor dx,dx
    div bx
    add dx,30h
    push dx 
    inc cx
    cmp ax,0
    jne HiThi:
    
    mov ah,09h
    lea dx,thongbao
    int 21h
    
DocStack:
    pop dx    
    
    mov ah,02h
    int 21h
    loop DocStack

    mov ah,4ch
    int 21h
    main endp
end main