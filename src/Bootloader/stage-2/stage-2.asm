jmp stage_2_init

 %include "src/Bootloader/stage-2/GDT.asm"

stage_2_init:
 	 ; Call the BIOS function to enable the A20 line
     mov ax, 0x2401       ; Function 0x2401 - Enable A20 line
     int 0x15             ; Call BIOS interrupt 0x15

	;enter protected mode
	cli                   ; disable interrupts
	lgdt [GDT_descriptor] ; update the gdt address
	;change last bit of cr0 to 1 to enable protected mode
	mov eax, cr0  
	or eax, 1     
	mov cr0, eax

	; far jump to another segment to start protected mode
	jmp CODE_SEG:start_protected_mode

[bits 32]

start_protected_mode:
	mov al, 'A'
	mov ah, 0x0f
	mov [0xb8000], ax

