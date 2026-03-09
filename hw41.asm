.model small
.stack 100h

.data
msg1 db 'Number: $'
msg2 db 13,10,'Factorial: $'

.code
main proc
mov ax,@data
mov ds,ax

mov ax,5

mov dx,offset msg1
mov ah,09h
int 21h

mov bx,ax
call print_num

call factorial_iter

mov dx,offset msg2
mov ah,09h
int 21h

call print_num

mov ah,4ch
int 21h
main endp


factorial_iter proc
mov cx,ax
dec cx
mov bx,ax

L1:
mul cx
loop L1

ret
factorial_iter endp


print_num proc
push ax
push bx
push cx
push dx

mov cx,0
mov bx,10

L2:
xor dx,dx
div bx
push dx
inc cx
cmp ax,0
jne L2

L3:
pop dx
add dl,'0'
mov ah,02h
int 21h
loop L3

pop dx
pop cx
pop bx
pop ax
ret
print_num endp

end main