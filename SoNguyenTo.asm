.model small
.stack 50
.data
    tenfile db 'test.txt',0
    output db 'out.txt',0
    handle dw ?
    mang db 255 dup('$')
    x dw ? 
    res dw 0 
    ketqua dw 10 dup(' ')  
    khoangcach db ' '
    count dw 1
    nhan10 dw 10
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,3dh
    lea dx,tenfile
    mov al,02h
    int 21h 
    
    mov handle,ax
    
    lea dx,[mang]
    xor si,si
    
Lap:
    lea dx,[mang+si]
    mov bx,handle
    mov cx,1
    mov ah,3fh
    int 21h
    
    cmp ax,0
    je Thoat
    inc si
    jmp Lap  
Thoat:
    lea si,[mang]
    mov bx,10
    
    mov ah,3eh
    mov bx,handle
    int 21h
    
    mov ah,3ch
    lea dx,output
    mov cx,00h
    int 21h
    
    mov handle,ax
    
Thoat1:
    mov x,0 
    cmp [si],24h
    je Xuly
    cmp [si],20h
    je Xuly
NhapSo:
    xor ax,ax
    cmp [si],24h
    je Xuly
    cmp [si],20h
    je Xuly  
    sub [si],30h
    mov ax,x
    mul nhan10
    add al,[si]
    mov x,ax
    inc si
    jmp NhapSo        
Xuly:
    mov res,0 
    call SoNguyenTo
    cmp res,1
    jne Next
    call GhiFile
    
    mov ah,40h
    lea dx,ketqua
    mov cx,count
    mov bx,handle
    int 21h 
    
    mov ah,40h
    lea dx,khoangcach
    mov cx,1
    int 21h 
    
Next:
    cmp [si],24h
    je Exit    
    mov x,0
    inc si
    jmp Thoat1   
Exit:
    mov ah,3eh
    mov bx,handle
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp 
;;;;;;;;;;;;;;;;;;;
SoNguyenTo proc
    mov cx,1
    mov bx,x
    dec bx
    mov res,0
    cmp x,0
    je ThoatSai
    cmp x,1
    je ThoatSai
    cmp x,2
    je ThoatDung
    cmp x,3
    je ThoatDung
    cmp x,4
    je ThoatSai
LapSNT: 
    xor dx,dx
    inc cx
    cmp cx,bx
    je ThoatDung
    mov ax,x
    div cx
    cmp dx,0
    je ThoatSai
    jmp LapSNT
ThoatDung:
    mov res,1
    ret
ThoatSai:
    mov res,0
    ret
SoNguyenTo endp
;;;;;;;;;;;;;;;;;;   
Ghifile proc
    xor di,di
    lea di,[ketqua]
    
Xoamang:
    mov [di],20h
    inc di
    cmp [di],20h
    jne Xoamang
    
    lea di,[ketqua]       
    xor cx,cx
    mov ax,x

LapChia:
    xor dx,dx
    div nhan10
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne LapChia
    
    mov count,cx
    
Docstack:
    pop [di]
    inc di
    loop Docstack
    
    ret
Ghifile endp
;;;;;;;;;;;;;;;;;;;;    
end main