enter_protected_mode:
	;enter protected mode
	cli                   ; disable interrupts
	lgdt [GDT_descriptor] ; update the gdt address
	
	;change last bit of cr0 to 1 to enable protected mode
	mov eax, cr0  
	or eax, 1     
	mov cr0, eax

	;update segments
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax

    ret