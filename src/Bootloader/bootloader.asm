org 0x7c00

stage_1_start:
	%include "src/Bootloader/stage-1/stage-1.asm"
	
stage_2_start:
	%include "src/Bootloader/stage-2/stage-2.asm"
	align 512, db 0
stage_2_end:	
	
	
kernel:
	align 512, db 0
