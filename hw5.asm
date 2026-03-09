.model small
.stack 100h

.data

.code
main proc
mov ax,@data
mov ds,ax

; приклад: ширина 20, висота 10
mov ah,20
mov al,10

mov bl,al      ; висота
mov bh,ah      ; ширина

mov cx,0

row_loop:

mov dl,'*'
mov ah,02h
int 21h

mov si,1

col_loop:

cmp si,bh
jge end_col

mov dl,' '
mov ah,02h
int 21h

inc si
jmp col_loop

end_col:

mov dl,'*'
mov ah,02h
int 21h

mov dl,13
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

inc cx
cmp cx,bl
jl row_loop

mov ah,4ch
int 21h

main endp
end main