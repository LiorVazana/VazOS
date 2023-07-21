stage_2_init:
	; init GDT
	mov word ptr [GDT], 0xffff
	add word ptr [GDT + 6], 0xf

	; update the GDT address
	lgdt GDT

	; Call the BIOS function to enable the A20 line
    mov ax, 0x2401       ; Function 0x2401 - Enable A20 line
    int 0x15            ; Call BIOS interrupt 0x15
    
GDT dw 4 dup(0)
