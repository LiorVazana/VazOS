jmp stage_2_init

STAGE2_ENTER_MSG db "In stage 2!", 0
 %include "src/Bootloader/stage-2/GDT.asm"
 %include "src/Bootloader/stage-2/a20_line.asm"
 %include "src/Bootloader/stage-2/protected_mode.asm"
 %include "src/Bootloader/stage-2/unreal_mode.asm"
 %include "src/Bootloader/stage-2/load_kernel.asm"


stage_2_init:
	mov bx, STAGE2_ENTER_MSG
	call print_string_with_new_line

	call enable_a20_line
	call enter_unreal_mode

	call load_kernel

	call enter_protected_mode

	; far jump to another segment to start protected mode
	jmp CODE_SEG:start_protected_mode

[bits 32]

start_protected_mode:
	mov al, 'A'
	mov [0xb8000], al

	jmp kernel_start
