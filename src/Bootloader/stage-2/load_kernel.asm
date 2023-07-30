KERNEL_ADDR equ 0x100000

 load_kernel:
    mov ah, 0                                      ; read mode
    mov dl, [CURR_DISK]                               ; disk index
    mov al, (kernel_end - kernel_start) / 512         ; kernel size
    mov ch, 0                                         ; first cylinder
    mov cl, 2 + (stage_2_end - stage_2_start) / 512   ; start sector
    mov dh, 0                                         ; first head
    mov bx, 0x7e00 + (stage_2_end - stage_2_start)    ; sector address
    int 13h
    ret