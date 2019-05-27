.model small
.stack 50
.data
sngay db "Ngay : $"
sthang db 10,13,"thang : $"
snam db 10,13,"Nam : $"  
sthu db 10,13,"thu : $"
ingay dw ?
ithang dw ?
inam dw ? 
ithu dw ?
chunhat db "chu nhat$"
.code

inthongbao macro chuoi
    lea dx,chuoi
    mov ah, 09h
    int 21h
endm
 

main proc
    mov ax,@data
    mov ds,ax
    
    call layngay
    
    inthongbao sngay 
    mov ax,ingay
    call inso
    inthongbao sthang 
    mov ax,ithang
    call inso           
    inthongbao snam
    mov ax,inam
    call inso
    inthongbao sthu
    mov ax,ithu
    cmp ax,1
    je Inchunhat
    call inso 
    jmp thoat
Inchunhat:
    inthongbao chunhat
thoat:    
    mov ah,4ch
    int 21h
main endp

layngay proc
    mov ah,2ah
    int 21h
    mov inam,cx
    mov bl,dh
    mov bh,0
    mov ithang,bx 
    mov bl,dl
    mov bh,0
    mov ingay,bx
    mov bl,al
    mov bh,0 
    inc bx
    mov ithu,bx
    ret 
layngay endp

inso proc     
    xor cx,cx
    mov bx,10
lap:
    
    xor dx,dx
    div bx
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne lap
docstack:
    pop dx
    mov ah,02h
    int 21h
    loop docstack
    ret
inso endp
end main



;code by Gio Quy (WE)
;WW   WW   WW   EEEEE
; WW  WW  WW    EE
; WW WWWW WW    EEEEE
;  WW WW WW     EE
;  WW WW WW     EEEEE