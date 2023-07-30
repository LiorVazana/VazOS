enter_unreal_mode:
    cli                   ; disable interrupts

    push ds
    push es

	lgdt [GDT_descriptor] ; update the gdt address
	
	;change last bit of cr0 to 1 to enable protected mode
	mov eax, cr0  
	or eax, 1     
	mov cr0, eax

    ;update segments
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax

    ; exit protected mode
    mov eax, cr0  
	xor eax, 1     
	mov cr0, eax

    jmp 0x0:.unreal_mode_far_jmp

.unreal_mode_far_jmp:

    pop es
    pop ds

    sli
    ret