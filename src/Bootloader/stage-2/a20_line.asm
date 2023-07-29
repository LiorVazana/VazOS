enable_a20_line:
 	 ; Call the BIOS function to enable the A20 line
     mov ax, 0x2401       ; Function 0x2401 - Enable A20 line
     int 0x15             ; Call BIOS interrupt 0x15
     ret