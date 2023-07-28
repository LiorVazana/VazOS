org 0x7c00
[bits 16]

main:
	; setup segments
	xor ax, ax
	mov ds, ax
	mov es, ax

	; save the disk we booted from for later use
	mov [CURR_DISK], dl 
	
	; setup stack
	mov ss, ax
	mov sp, 0x7c00

	; load stage-2 from disk to RAM
	mov ah, 02h            						    ; read mode
	mov dl, [CURR_DISK]   							; disk index
	mov al, (stage_2_end - stage_2_start) / 512     ; size of stage-2
	mov ch, 0 									    ; first cylinder
	mov cl, 2										; start sector
	mov dh, 0                                       ; first head
	mov bx, 0x7c00 + 512                            ; sector address 
	int 13h										    ; disk interrupt

	; enter stage-2
	mov bx, JUMP_MSG
	call print_string

	jmp stage_2_start



%include "./src/Bootloader/stage-1/strings_functions.asm"

JUMP_MSG db "Jumping to stage 2!", 0
CURR_DISK db 0

times 510 - ($-$$) db 0
db 0x55
db 0xaa
