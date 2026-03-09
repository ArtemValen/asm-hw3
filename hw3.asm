.model small
.stack 100h

.data
msgNum db 'Number: $'
msgPrime db 13,10,'The number is PRIME$'
msgNotPrime db 13,10,'The number is NOT PRIME$'

.code
main proc

mov ax, @data
mov ds, ax

mov ax, 17

mov dx, offset msgNum
mov ah, 09h
int 21h

mov bx, ax

call print_num

mov cx, 2
mov ax, bx

cmp ax, 2
jl not_prime

check_loop:
mov dx, 0
div cx

cmp dx, 0
je not_prime

mov ax, bx
inc cx

cmp cx, bx
jl check_loop

mov dx, offset msgPrime
mov ah, 09h
int 21h
jmp exit

not_prime:
mov dx, offset msgNotPrime
mov ah, 09h
int 21h

exit:
mov ah, 4ch
int 21h

main endp


print_num proc
push ax
push bx
push cx
push dx

mov cx, 0
mov bx, 10

convert:
xor dx, dx
div bx
push dx
inc cx
cmp ax, 0
jne convert

print:
pop dx
add dl, '0'
mov ah, 02h
int 21h
loop print

pop dx
pop cx
pop bx
pop ax
ret

print_num endp

end main