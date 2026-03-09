.model small
.stack 100h

.data
array db 5,3,8,1,4
sorted db 5 dup(?)

.code
main proc

mov ax,@data
mov ds,ax

lea si,array
lea di,sorted
mov cx,5
mov bx,1

call sort

mov ah,4ch
int 21h

main endp


sort proc

push si
push di
push cx
push bx

mov dx,cx

copy_loop:
mov al,[si]
mov [di],al
inc si
inc di
loop copy_loop

pop bx
pop cx
pop di
pop si

mov dx,cx
dec dx

outer_loop:
mov si,di
mov cx,dx

inner_loop:

mov al,[si]
mov bl,[si+1]

cmp al,bl
jbe no_swap

mov [si],bl
mov [si+1],al

no_swap:

inc si
loop inner_loop

dec dx
jnz outer_loop

ret

sort endp

end main