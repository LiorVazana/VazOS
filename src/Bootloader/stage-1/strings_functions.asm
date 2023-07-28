; char value passed through al
; string pointer passed through bx
print_char:
	push ax
	mov ah, 0eh ; print chat code for int 10h
	int 10h
	pop ax
	ret

print_string:
	push ax
	push bx
	
	mov ah, 0eh ; print chat code for int 10h

.loop:
	mov al, [bx]
	cmp al, 0 ; end of string ('\0')
	je .end
	
	int 10h
	inc bx ; next char (i++) 
	jmp .loop

.end:
	pop bx
	pop ax
	ret

new_line:
	push ax
	mov al, 0xa ; '\n' for new line
	mov ah, 0eh ; print chat code for int 10h
	int 10
	pop ax
	ret
	
print_string_with_new_line:
	call print_string
	call new_line
	ret

print_number:
	push ax
	push cx
	push dx
	push bx

	xor cx, cx
	mov bx, 10

.every_digit:
	xor dx, dx
	div bx
	push dx
	inc cx
	cmp ax, 0
	jnz .every_digit

.print:
	pop ax
	add al, '0'
	call print_char
	loop .print

	pop bx
	pop dx
	pop cx
	pop ax
	ret