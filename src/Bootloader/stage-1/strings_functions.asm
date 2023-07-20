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
