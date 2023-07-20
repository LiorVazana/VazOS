org 0x7c00
bits 16

main:
	; setup segments
	xor ax, ax
	mov ds, ax
	mov es, ax

	; setup stack
	mov ss, ax
	mov sp, 0x7c00

	mov bx, JUMP_MSG
	call print_string
	
	jmp stage_2_start



%include "./src/Bootloader/stage-1/strings_functions.asm"

JUMP_MSG db "Jumping to stage 2!"

times 510 - ($-$$) db 0
db 0x55
db 0xaa
